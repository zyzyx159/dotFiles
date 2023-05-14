# Dot files
This is my personal collection of settings for my PCs.

## Windows notes:
- Starship = C:users\<user>\.config\starship.toml
- Terminal Icons = https://github.com/devblackops/Terminal-Icons
- Lunarvim = C:\Users\<user>\AppData\Local\lvim\.config.lua
- PowerShell:
  1. in terminal run '$profile'
  2. Put the files there
  3. New-Item -ItemType SymbolicLink -Path $path -Target $target
    1. $path = short cut
    2. $target = git folder, the actual file

## Linux Notes:
- Lunarvim = ~/.config/lvim/config.lua 
- Starship = ~/.config/starship.toml
- Tmux = ~/.config/tmux/tmux.conf
- Zsh = ~/.zshrc
