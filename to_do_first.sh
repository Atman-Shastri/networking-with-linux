#!/bin/bash
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/dont-prompt-$USER-for-sudo-password"
touch ~/.bash_aliases
cat << 'EOF' >> ~/.bash_aliases
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
EOF
sudo apt update
sudo apt-get install autojump xdotool curl wget xclip gnome-usage make trash-cli fzf -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh ./Miniconda3-latest-Linux-x86_64.sh -b
rm Miniconda3-latest-Linux-x86_64.sh
cat << 'EOF' >> ~/.bashrc
. /usr/share/autojump/autojump.sh
export PATH="$PATH:/home/$USER/workspace/ns-allinone-3.32/netanim-3.108/"
source /etc/bash_completion.d/git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$ '
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$USER/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/$USER/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/$USER/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate py2.7.18
EOF
. ~/.bashrc
conda create -n py2.7.18 -y
conda activate py2.7.18
conda install python=2.7.18 -y
wget https://github.com/aristocratos/btop/releases/download/v1.2.13/btop-x86_64-linux-musl.tbz
tar -xjf btop-x86_64-linux-musl.tbz
cd btop/
sudo make install
sudo make setuid
cd
rm -rf btop btop-x86_64-linux-musl.tbz




