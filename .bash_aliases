# ###########################
#  Requires:
#    - colorls
#    - ranger
#    - neovim
#
# ###########################
#  if [ -f ~/.bash_aliases ]; then
#  . ~/.bash_aliases
#  fi
# ###########################

# pacman
alias pac='sudo pacman -Sy'
alias pacs='sudo pacman -Syu'
alias pacref='sudo pacman -Syyu'
alias pacr='sudo pacman -Rs'
alias pacq='pacman -Qs'
alias yays='yay -Sy'
alias yayr='yay -Rs'
alias yayq='yay -Qs'

# system
alias _='sudo'
alias __='sudo -i'
alias se='sudo -e'
alias sctl='sudo systemctl'

# Working Directory
alias cwd='cd ~/Code'
alias cwdl='cd ~/Code/lib'

# config
alias vbrc='vi ~/.bashrc'
alias vbas='vi ~/.bash_aliases'
alias ssha='eval `ssh-agent -s`'

# colorls
alias ls='colorls --sd'
alias la='colorls -a --sd'
alias ll='colorls -lA --sd'
alias lg='colorls -lA --sd --gs'
alias l='colorls --sd'

# file
alias rg='ranger .'
alias rgr='ranger ~/'

# edit
alias vim='nvim'
alias vedit='nvim ~/.config/nvim/init.vim'
alias vide='nvim +NERDTree'
alias viplug='nvim +PlugInstall'
alias vgit='nvim ~/.gitconfig'

# cmd
alias g='git'
alias gsync='git pl && git ps'
alias y='yarn'
alias ws='windscribe'
alias vpn='sudo systemctl start windscribe'
alias svpn='sudo systemctl stop windscribe'
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

# windscribe
alias wss='windscribe status'
alias wsc='windscribe connect'
alias wsd='windscribe disconnect'

# input
alias controller='sudo xboxdrv --detach-kernel-driver --led 2' # For PS3 Controller
