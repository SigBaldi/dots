#!/bin/zsh

DOTS_DEBUG=false
DOTS_VERSION="0.1.0"

# Global config paths
export DOTS_BASE_DIR="$XDG_DATA_HOME"  # Local repository via XDG_DATA_HOME
export DOTS_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"  # Default to ~/.config

# Placeholder to be replaced during installation
SCRIPTSDIR="./src"

source "$SCRIPTSDIR/utils"

show_help() {
    cat << EOF
dots - Dotfiles Management Tool

Usage: dots [options] <command> [command-options] <path>

Global Options:
  -d, --debug           Enable debug mode
  -h, --help            Show this help message
  -v, --version         Show version information

Commands:

  Management Commands:
    init [options] <dir>    Initialize a new dotfiles repository, 
    list [options]          List available or installed dotfiles and configs
    edit <path>             Edit a dotfile or config (pulls latest changes first)
    deploy <path>           Install config files and push changes to GitHub
    sync <path>             Complete workflow: edit and deploy in one go

    Options for 'init' command:
        -y, --yes                   Creates a ./config directory and initializes it as a git repository
        -d, --directory <path>      Specify the path of an existing dotfiles repository
        -n, --name <name>           Specify the name of the repository, default is 'dotfiles' and must follow the -d flag

    Options for 'list' command:

        Display Options:
            -a, --all                List both available and installed configurations
            -i, --installed          List installed configurations

         Help Options:
           -h, --help                Show this help message

  Help Commands:
    help                     Show this help message
    version                  Show version information

Examples:

  dots init -y               # Initialize a new dotfiles repository in ~/.config
  dots list                  # List available configurations
  dots list -i               # List only installed configurations
  dots edit .zshrc           # Edit your zsh config
  dots deploy nvim           # Deploy Neovim config changes
  dots sync kitty            # Edit and deploy Kitty config

For more information, visit: https://github.com/SigBaldi/dots
EOF
}

# Parse global options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -d|--debug)
            DEBUG=true
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            echo "$DOTS_VERSION"
            exit 0
            ;;
        -*)
            error "Unknown option $1"
            show_help
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

command=$1
shift  # Shift the 'command' argument

if [[ "$DOTS_DEBUG" == true ]] && echo "Executing: $SCRIPTSDIR/$command $@"; then
    set -x
fi

export DOTS_DEBUG  # Export DEBUG so that sub-scripts can access it if needed

case $command in
    "")
    echo '
            _                      _                        
           (_)                    (_)
   _  _  _ (_)     _  _  _      _ (_) _  _     _  _  _  _     
 _(_)(_)(_)(_)  _ (_)(_)(_) _  (_)(_)(_)(_)   _(_)(_)(_)(_)    
(_)        (_) (_)         (_)    (_)        (_)_  _  _  _     
(_)        (_) (_)         (_)    (_)     _    (_)(_)(_)(_)_   
(_)_  _  _ (_) (_) _  _  _ (_)    (_)_  _(_)    _  _  _  _(_)  
  (_)(_)(_)(_)    (_)(_)(_)         (_)(_)     (_)(_)(_)(_)
    '
    show_help
    exit 0
    ;;
    "edit")
        "$SCRIPTSDIR/edit" "$@"
        ;;
    "deploy")
        "$SCRIPTSDIR/deploy" "$@"
        ;;
    "init")
        "$SCRIPTSDIR/init" "$@"
        ;;
    "list")
        "$SCRIPTSDIR/list" "$@"
        ;;
    "sync")
        "$SCRIPTSDIR/sync" "$@"
        ;;
    "version")
        echo "$DOTS_VERSION"
        ;;
    "help")
        show_help
        exit 0
        ;;
    *)
        echo "Unknown command: $command"
        show_help
        exit 1
        ;;
esac