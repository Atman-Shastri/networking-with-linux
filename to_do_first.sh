#!/bin/bash
cp .bash_aliases ~
. ~/.bashrc
sudo apt update
sudo apt-get install autojump -y
echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc
. ~/.bashrc
echo 'export PATH=$PATH:/home/atman/workspace/ns-allinone-3.32/netanim-3.108/' >> ~/.bashrc
. ~/.bashrc

