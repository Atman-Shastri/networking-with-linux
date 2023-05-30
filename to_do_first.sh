#!/bin/bash
cp .bash_aliases ~
sudo apt update
sudo apt-get install autojump xdotool curl wget xclip -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh ./Miniconda3-latest-Linux-x86_64.sh -b
rm Miniconda3-latest-Linux-x86_64.sh
cat << 'EOF' >> ~/.bashrc
. /usr/share/autojump/autojump.sh
export PATH="$PATH:/home/atman/workspace/ns-allinone-3.32/netanim-3.108/"
source /etc/bash_completion.d/git-prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$ '
EOF
. ~/.bashrc



