# system
alias -s s='sudo'
alias -s si='sudo -i'
alias -s se='sudo -e'
alias -s sctl='sudo systemctl'
alias -s lctl='loginctl'

# package manager
alias -s pac='sudo pacman -Sy'
alias -s pacs='sudo pacman -Syu'
alias -s pacref='sudo pacman -Syyu'
alias -s pacss='sudo pacman -Syy'
alias -s pacr='sudo pacman -Rs'
alias -s pacq='sudo pacman -Qs'

alias -s fin='flatpak install'
alias -s frm='flatpak remove --delete-data'
alias -s fup='flatpak update'
alias -s fupp='flatpak update --appstream'

# dev
alias -s pm='pnpm'
alias -s lg='lazygit'
alias -s g='git'
alias -s gsy='git pl && git ps'
alias -s y='yarn'

# Working Directory
alias -s cwda='cd ~/Documents/Acads'
alias -s cwd='cd ~/Projects'
alias -s cwdl='cd ~/Projects/libs'

# config
alias -s ssha='eval (ssh-agent -s)'

# file
alias -s rg='ranger .'
alias -s rgr='ranger ~/'

# edit
alias -s vi='nvim'
alias -s vedit='nvim ~/.config/nvim/init.lua'
alias -s vide='nvim +NvimTreeOpen'
alias -s viplug='nvim +PlugInstall'
alias -s vgit='nvim ~/.gitconfig'
alias -s gef='gnome-text-editor'

# services
alias -s bt='sudo systemctl start bluetooth'
alias -s sbt='sudo systemctl stop bluetooth'
alias -s smbs='sudo systemctl start smb'

# etc
alias -s cls='clear'
alias -s k='clear'
alias -s rcref='. ~/.bashrc'
alias -s bye='shutdown now'
