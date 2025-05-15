# dots [![Release](https://github.com/SigBaldi/dots/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/SigBaldi/dots/actions/workflows/release.yml)

A streamlined CLI tool for managing your dotfiles and configurations with Git integration.

## Features

- **Version Control:** Git-based tracking and syncing of your dotfiles.
- **Flexible Editing:** Easily edit or create configurations in your terminal, pulling the latest changes before you start.
- **Automatic Deployment:** Quickly deploy configurations to system locations and push changes to GitHub. Useful if you edit your config files on a separate IDE.
- **Completions & Docs:** Shell completions and a full man page for offline reference.
- **One-Step Workflow:** Use `sync` to combine editing and deployment into a single command.

## Requirements

- **Platform:** macOS (primary)
- **Shell:** Zsh (primary)
- **Tools:** Git for version control, `vim` (or another `$EDITOR` of your choice)

## Configuration

**Environment Variables:**
- **`$XDG_CONFIG_HOME`**: Directory for configuration files.  
  Defaults to `~/.config` if unset.
- **`$XDG_DATA_HOME`**: Directory for your dotfiles repository.  
  Must be a Git repository. Defaults to `~/.local/share/dots` if unset.
- **`$EDITOR`**: Preferred text editor. Defaults to `vim` if unset.

**Example:**
```bash
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/path/to/my-dotfiles" # Must be a Git repository
export EDITOR="vim"
```

These paths can be customized by setting the environment variables before running dots.

On MacOS, add these to your .zshrc:
```bash
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/[your local dotfiles repository]"
export EDITOR="vim"  # optional: set your preferred editor
```

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
### Global Options:
<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code>-d, --debug</code>
      </td>
      <td>Enable debug mode</td>
    </tr>
    <tr>
      <td>
        <code>-h, --help</code>
      </td>
      <td>Show the help message</td>
    </tr>
    <tr>
      <td>
        <code>-v, --version</code>
      </td>
      <td>Show the version information</td>
    </tr>
  </tbody>
</table>

### Commands:
  #### `init [options]`
  Initialize a new dotfiles repository, defaults to `~/.local/share/dots`

  Options for 'init' command:
<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <code>-b, --bare &lt;path&gt;</code>
      </td>
      <td>Specify the path of an existing dotfiles repository to be managed by dots</td>
    </tr>
    <tr>
      <td>
        <code>-g, --github &lt;repo&gt;</code>
      </td>
      <td>Specify the GitHub repository url, must follow the -b flag as the location where it will clone and manage the repository</td>
    </tr>
    <tr>
      <td>
        <code>-n, --name &lt;name&gt;</code>
      </td>
      <td>Specify the name of the new repository to initialise and manage, and must follow the -b flag as the location where to create it</td>
    </tr>
  </tbody>
</table>
  
  #### `list [options]`
  List available or installed dotfiles and configs
  #### `edit <path>`
  Edit a dotfile or config (pulls latest changes first)
  deploy <target>         Install config files and push changes to GitHub
  sync <target>           Complete workflow: edit and deploy in one go
  
  
  Options for 'list' command:

    Display Options:
      -a, --all                List both available and installed configurations
      -i, --installed          List installed configurations

Help Commands:
  help                     Show this help message
  version                  Show version information

Examples:
  | Command                 | Description |
  |-------------------------|-------------|
  | dots list               | List available dotfiles and config directories |
  | dots list -i            | List only installed configurations |
  | dots edit .zshrc        | Edit your zsh config |
  | dots deploy nvim        | Deploy Neovim config changes |
  | dots sync kitty         | Edit and deploy Kitty config |

## Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## License

MIT License

## Support
If you find this tool useful:
- 🍺 As per [Beerware](https://en.wikipedia.org/wiki/Beerware) - if we meet, you owe me a beer!
- ☕ Keep me coding with caffeine at [Buy Me a Coffee](https://buymeacoffee.com/sigbaldi)
