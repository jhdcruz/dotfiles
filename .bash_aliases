# pacman
alias pac='sudo pacman -Sy'
alias pacss='sudo pacman -Syu'
alias pacs='sudo SKIP_AUTOSNAP= pacman -Syu'
alias pacref='sudo pacman -Syyu'
alias pacr='sudo pacman -Rs'
alias pacq='pacman -Qs'
alias yays='yay -Sy'	
alias yayy='yay -Sua'
alias yayr='yay -Rs'
alias yayq='yay -Qs'

# system
alias _='sudo'
alias __='sudo -i'
alias se='sudo -e'
alias sctl='sudo systemctl'
alias lctl='loginctl'

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
alias cwdac='cd ~/Documents/Acads/CIT508'
alias cwd='cd ~/Projects'
alias cwdl='cd ~/Projects/lib'

# config
alias vbrc='vi ~/.bashrc'
alias vbas='vi ~/.bash_aliases'
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
