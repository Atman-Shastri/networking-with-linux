alias inschrome='wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb'
alias apti='sudo apt-get install -y'
alias reqs='sudo apt-get install -y procps'
alias reload='. ~/.bashrc && exec bash'
alias clip='xargs echo -n | xclip -selection clipboard'
alias nodemanin='curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash'
alias pythonmanin='wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh -b'
alias mongodblink='https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/#std-label-install-mdb-community-ubuntu'
#alias pixiins='curl -fsSL https://pixi.sh/install.sh | bash && echo 'eval "$(pixi completion --shell bash)"' >> ~/.bashrc'
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
# alias fzf='fzf | clip'
alias sudo='sudo '
alias rmls='trash-list'
alias rmrs='trash-restore'
alias rmemp='trash-empty'
alias py='python'
alias rmount="rclone mount LOS:laric_online_storage ~/LOS/ &"
ns() {
    sudo ./waf --run $1
}
alias busy-ports="lsof -i -P -n | awk 'NR == 1 || /LISTEN/ {print}'"
alias duplicate-services="sudo find /etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/ -name '*.service' -print | sort | uniq -d"
