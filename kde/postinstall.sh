sudo pacman -Sy ksshaskpass --noconfirm

# Solve VSCode's ssh-askpass error
# https://forum.manjaro.org/t/vscode-git-ssh-askpass-exec-usr-lib-ssh-ssh-askpass-no-such-file-or-directory/78787
sudo ln /usr/bin/ksshaskpass /usr/lib/ssh/ssh-askpass
