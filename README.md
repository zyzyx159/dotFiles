# Dot files
This is my personal collection of settings for my PCs.

## Windows notes:
- Starship = C:users\<user>\.config\starship.toml
- Terminal Icons = https://github.com/devblackops/Terminal-Icons
- Lunarvim = C:\Users\<user>\AppData\Local\lvim\.config.lua
- PowerShell:
  1. in terminal run '$profile'
  2. Put the files there
 - In Power shell:
    1. New-Item -ItemType SymbolicLink -Path $path -Target $target
    2. $path = short cut
    3. $target = git folder, the actual file
 - In CMD:
   1. mklink Link Target
   2. Link = short cut
   3. Target = git folder, the actual file

## Linux Notes:
### ln -s source_file symbolic_link

- Lunarvim = ln -s ~/git/dotFiles/lvim/config.lua ~/.config/lvim/config.lua 
- Starship = ln -s ~/git/dotFiles/starship/starship.toml ~/.config/starship.toml
- Tmux = ln -s ~/git/dotFiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
- Zsh = ln -s ~/git/dotFiles/zsh/.zshrc ~/.zshrc
                                                        
