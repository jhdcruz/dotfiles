# ###########################
#  Requires:
#    - colorls
#    - ranger
#    - neovim
# ###########################

# sudo
alias _='sudo'
alias __='sudo -i'

# Working Directory
alias cwd='cd /mnt/d/Code'
alias cwdw='cd /mnt/d/Code/web'
alias cwdwa='cd /mnt/d/Code/web/Academics'

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

# etc
alias cls='clear'
alias rcref='. ~/.bashrc'

# input
alias controller='sudo xboxdrv --detach-kernel-driver --led 2' # For PS3 Controller
