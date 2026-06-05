# Renan's setup

Personal checklist for setting up a new Mac while keeping Linux/WSL compatibility around.

## Daily apps

- [Helium Browser](https://helium.computer/) — browser
- [Todoist](https://www.todoist.com/) — tasks
- [Raycast](https://www.raycast.com/) — launcher and shortcuts
- [Slack](https://slack.com/) — work communication
- [Obsidian](https://obsidian.md/) — local notes
- [Ghostty](https://ghostty.org/) / [WezTerm](https://wezterm.org/) — terminal
- [Zed](https://zed.dev/) — code editor
- [Pi](https://pi.dev/) — coding agent
- [VIA](https://usevia.app/) — keyboard configuration

## Terminal / CLI

- Shell config shared across macOS, Linux, and WSL
- zsh config for macOS
- bash config for Linux/WSL
- tmux config
- git config using GitHub CLI auth
- pi settings
- Homebrew `Brewfile` for Mac CLI tools
- small scripts

## Repo map

- `Brewfile` — Mac CLI packages
- `bashrc/.bashrc` — bash entrypoint
- `zsh/.zshrc` — zsh entrypoint
- `shell/` — shared and OS-specific shell config
- `tmux/.tmux.conf` — tmux config
- `git/.gitconfig` — git config
- `pi/settings.json` — pi settings
- `scripts/` — small utilities
