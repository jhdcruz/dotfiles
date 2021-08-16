# ###########################
#  Requires:
#    - colorls
#    - ranger
#    - neovim
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
alias sctl='sudo systemctl'

# Working Directory
alias cwd='cd ~/Code'
alias cwdl='cd ~/Code/lib'
alias cwdp='cd ~/Code/proj'
alias cwda='cd ~/Code/acads'

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
alias vi='nvim'
alias vedit='nano ~/.config/nvim/init.vim'
alias vide='nvim +NERDTree'
alias viplug='nvim +PlugInstall'

# cmd
alias g='git'
alias y='yarn'
alias ws='windscribe'

# etc
alias cls='clear'
alias k='clear'
alias rcref='. ~/.bashrc'

# input
alias controller='sudo xboxdrv --detach-kernel-driver --led 2' # For PS3 Controller
