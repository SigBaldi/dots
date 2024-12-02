# dots

A streamlined CLI tool for managing dotfiles and configurations with Git integration.

## Features
- Edit configs while pulling latest changes
- Automatic deployment to system locations
- Git-based version control
- Shell completions
- Full man page documentation

## Requirements
- macOS (primary platform)
- Zsh shell
- Git
- vim (or your preferred editor, mine is Neovim)
- tree (or eza for enhanced directory views)

## Configuration
The tool uses XDG-style configuration paths for consistency with Linux:
- `$XDG_DATA_HOME`: Base directory for your dotfiles repository.
- `$XDG_CONFIG_HOME`: System config directory (typically ~/.config on Linux), but  on macOS it's typically unset.
- `$EDITOR`: Your preferred text editor (defaults to vim)

These paths can be customized by setting the environment variables before running dots.

On macOS, add these to your .zshrc:
```bash
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/[your dotfiles directory]"
export EDITOR="vim"  # optional: set your preferred editor
```

### Optional Enhancements
`eza`: Enhanced directory tree views (falls back to standard tree command)
`neovim`: Advanced text editing capabilities, lua scripting, and more

## Installation
From source:
```bash
git clone https://github.com/yourusername/dots
cd dots
make install
```

Using Homebrew:
```bash
brew install dots
```

## Usage
dots list            List available dotfiles and configs
dots edit <target>   Edit a dotfile or config (pulls latest changes first)
dots deploy <target> Install config files and push changes to GitHub
dots sync <target>   Complete workflow: edit and deploy in one go
dots help            Show this help message
