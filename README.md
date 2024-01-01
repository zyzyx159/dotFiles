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

- Kitty = ln -s ~/git/dotFiles/kitty/ ~/.config/kitty/
- Nvim-programing = ln -s ~/git/dotFiles/nvim-programing/ ~/.config/nvim/
- Nvim-writing = ln -s ~/git/dotFiles/nvim-writing/ ~/.config/nvim-writing/
- Custom Scripts = ln -s ~/git/dotFiles/scripts/ ~.config/custScripts/ 
- Starship = ln -s ~/git/dotFiles/starship/starship.toml ~/.config/starship.toml
- Terminator = ln -s ~/git/dotFiles/terminator ~/.config/terminator/
    - Kitty is now default, not sure if I wan to keep this one
- Tmux = ln -s ~/git/dotFiles/tmux/ ~/.config/tmux/
- Zsh = ln -s ~/git/dotFiles/zsh/.zshrc ~/.zshrc
- SSH config = cp ~/git/dotFiles/ssh/sshd_config /etc/ssh/sshd_config
    - This is not to be linked, I want this one copied
    - Also double check that file owner is root and permissions are 644
