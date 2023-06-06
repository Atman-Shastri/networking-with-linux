alias inschrome='wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb'
alias apti='sudo apt-get install -y'
alias reload='. ~/.bashrc && exec bash'
alias clip='xargs echo -n | xclip -selection clipboard'
alias nodemanin='curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
alias pythonmanin='wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh -b'
alias wslshutdown='wsl.exe --terminate $WSL_DISTRO_NAME'
alias wslreboot='cd /mnt/c/ && cmd.exe /c start "rebooting WSL" cmd /c "timeout 5 && wsl -d $WSL_DISTRO_NAME" && wsl.exe --terminate $WSL_DISTRO_NAME'
alias remotedesktopins="sudo apt update
curl -L -o chrome-remote-desktop_current_amd64.deb \
    https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
rm -rf ./chrome-remote-desktop_current_amd64.deb
sudo bash -c 'echo \"exec /etc/X11/Xsession /usr/bin/xfce4-session\" > /etc/chrome-remote-desktop-session'"
