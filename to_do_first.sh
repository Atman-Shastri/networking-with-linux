#!/bin/bash
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"
touch ~/.bash_aliases
cat << 'EOF' >> ~/.bash_aliases
alias inschrome='wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && rm google-chrome-stable_current_amd64.deb'
alias apti='sudo apt-get install -y'
alias reqs='sudo apt-get install -y procps'
alias reload='. ~/.bashrc && exec bash'
alias clip='xargs echo -n | xclip -selection clipboard'
# installations #
alias uvins='curl -LsSf https://astral.sh/uv/install.sh | sh'
alias nodeins='curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s install lts'
alias pythonins='wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && sh ./Miniconda3-latest-Linux-x86_64.sh -b'
alias remotedesktopins='sudo apt update
curl -L -o chrome-remote-desktop_current_amd64.deb \
    https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd>
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.d>
rm -rf ./chrome-remote-desktop_current_amd64.deb'

alias mongodblink='https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/#std-label-install-mdb-community-ubuntu'
alias wslshutdown='wsl.exe --terminate $WSL_DISTRO_NAME'
alias wslreboot='cd /mnt/c/ && cmd.exe /c start "rebooting WSL" cmd /c "timeout 5 && wsl -d $WSL_DISTRO_NAME" && wsl.exe --terminate $WSL_DISTRO_NAME'
alias rm='trash -v'
alias fzf='fzf | clip'
alias sudo='sudo '
alias cp='rsync -ah --progress'
alias rmls='trash-list'
alias rmrs='trash-restore'
alias rmemp='trash-empty -f'
alias rmount="rclone mount LOS:laric_online_storage ~/LOS/ &"
alias bash_alias="curl https://raw.githubusercontent.com/Atman-Shastri/networking-with-linux/refs/heads/main/to_do_first.sh"
alias busy-ports="lsof -i -P -n | awk 'NR == 1 || /LISTEN/ {print}'"
alias duplicate-services="sudo find /etc/systemd/system/ /lib/systemd/system/ /usr/lib/systemd/system/ -name '*.service' -print | sort | uniq -d"
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
EOF
sudo apt update
sudo apt-get install autojump xdotool curl wget xclip gnome-usage make bat trash-cli fzf glances unzip cpulimit ncdu unrar rclone -y
sudo ln -s /usr/bin/batcat /usr/local/bin/bat
cat << 'EOF' >> ~/.bashrc
. /usr/share/autojump/autojump.sh
echo 'eval "$(uv generate-shell-completion bash)"'
echo 'eval "$(uvx --generate-shell-completion bash)"'
EOF
. ~/.bashrc




