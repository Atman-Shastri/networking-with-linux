alias inschrome='wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb'
alias autopoweroff='wget https://github.com/deragon/autopoweroff/releases/download/4.2.0/autopoweroff-gui_4.2.0_all-ubuntu-22.04.deb && wget https://github.com/deragon/autopoweroff/releases/download/4.2.0/autopoweroff-daemon_4.2.0_all-ubuntu-22.04.deb
&& sudo apt install ./autopoweroff-daemon_4.2.0_all-ubuntu-22.04.deb && sudo apt install ./autopoweroff-gui_4.2.0_all-ubuntu-22.04.deb'
alias apti='sudo apt-get install -y'
alias reload='. ~/.bashrc && exec bash'
alias clip='xargs echo -n | xclip -selection clipboard'
alias nodemanin='curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
alias pythonmanin='wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh -b'
alias wslshutdown='wsl.exe --terminate $WSL_DISTRO_NAME'
alias wslreboot='cd /mnt/c/ && cmd.exe /c start "rebooting WSL" cmd /c "timeout 5 && wsl -d $WSL_DISTRO_NAME" && wsl.exe --terminate $WSL_DISTRO_NAME'
alias remotedesktopins='sudo apt update
curl -L -o chrome-remote-desktop_current_amd64.deb \
    https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd>
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.d>
rm -rf ./chrome-remote-desktop_current_amd64.deb'
alias rm='trash -v'
alias est='progress --monitor --pid $!'
alias cp='rsync -ah --progress'
alias fzf='fzf | clip'
alias sudo='sudo '
alias rmls='trash-list'
alias rmrs='trash-restore'
alias rmemp='trash-empty'
alias change_timezone='sudo dpkg-reconfigure tzdata'
alias mongodblink='https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/#std-label-install-mdb-community-ubuntu'
ns() {
    sudo ./waf --run $1
}
add_users() {
  for username in "$@"; do
    sudo useradd -m -G sudo -s /bin/bash "$username"
    sudo usermod -aG sudo "$username"
    
    # Set a default password for each user (change as needed)
    password="your_default_password"
    echo -e "$password\n$password" | sudo passwd "$username"
    
    echo "$username ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers
  done
}
