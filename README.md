# dots [![Release](https://github.com/SigBaldi/dots/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/SigBaldi/dots/actions/workflows/release.yml)

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
- vim (or your preferred editor)
- tree (or eza for enhanced directory views)

## Configuration
The tool uses XDG-style configuration paths for consistency with Linux:
- `$XDG_DATA_HOME`: Base directory for your dotfiles repository.
- `$XDG_CONFIG_HOME`: System config directory (typically ~/.config on Linux), but  on macOS it's typically unset.
- `$EDITOR`: Your preferred text editor (defaults to vim).

These paths can be customized by setting the environment variables before running dots.

On macOS, add these to your .zshrc:
```bash
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/[your local dotfiles repository]"
export EDITOR="vim"  # optional: set your preferred editor
```

### Optional Enhancements
`eza`: Enhanced directory tree views (falls back to standard tree command)
`neovim`: Advanced text editing capabilities, lua scripting, and more

## Installation
From source:
```bash
git clone https://github.com/SigBaldi/dots
cd dots
make install
```

Using Homebrew:
```bash
brew install dots
```

## Usage
```bash
dots list            List available dotfiles and configs
dots edit <target>   Edit a dotfile or config (pulls latest changes first)
dots deploy <target> Install config files and push changes to GitHub
dots sync <target>   Complete workflow: edit and deploy in one go
dots help            Show this help message
```
## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## License

MIT License

## Support
If you find this tool useful:
- 🍺 As per [Beerware](https://en.wikipedia.org/wiki/Beerware) - if we meet, you owe me a beer!
- ☕ Keep me coding with caffeine at [Buy Me a Coffee](https://buymeacoffee.com/sigbaldi)

