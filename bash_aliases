# system
alias _='sudo'
alias __='sudo -i'
alias se='sudo -e'
alias sctl='sudo systemctl'
alias lctl='loginctl'

# package manager
alias din='sudo dnf install'
alias dup='sudo dnf upgrade --refresh'
alias drm='sudo dnf remove'
alias dss='sudo dnf search'
alias dsi='sudo dnf search installed'

alias fin='flatpak install'
alias frm='flatpak remove --delete-data'
alias fup='flatpak update'
alias fupp='flatpak update --appstream'

alias dfup='sudo dnf upgrade --refresh -y && flatpak update -y'

# colorls
alias ls='colorls --sd'
alias la='colorls -a --sd'
alias ll='colorls -lA --sd'
alias l='colorls --sd'

# dev
alias pm='pnpm'
alias lg='lazygit'
alias g='git'
alias gsync='git pl && git ps'
alias y='yarn'

# Working Directory
alias cwda='cd ~/Documents/Acads'
alias cwd='cd ~/Projects'
alias cwdl='cd ~/Projects/lib'

# config
alias vbrc='vi ~/.zshrc'
alias ssha='eval `ssh-agent -s`'

# file
alias rg='ranger .'
alias rgr='ranger ~/'

# edit
alias vi='nvim'
alias vedit='nvim ~/.config/nvim/init.vim'
alias vide='nvim +NERDTree'
alias viplug='nvim +PlugInstall'
alias vgit='nvim ~/.gitconfig'
alias gef='gnome-text-editor'

# services
alias plex='sudo systemctl start plexmediaserver'
alias splex='sudo systemctl stop plexmediaserver'
alias bt='sudo systemctl start bluetooth'
alias sbt='sudo systemctl stop bluetooth'
alias smbs='sudo systemctl start smb'

# etc
alias cls='clear'
alias k='clear'
alias rcref='. ~/.bashrc'
alias bye='shutdown now'
