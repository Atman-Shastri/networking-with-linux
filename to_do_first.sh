#!/bin/bash
cp .bash_aliases ~
. ~/.bashrc
sudo apt update
sudo apt-get install autojump -y
echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc
. ~/.bashrc
