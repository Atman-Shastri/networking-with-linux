#!/bin/bash
echo -e "Enabling Secure Script Execution\n"
set -eu -o pipefail

if [ "$EUID" -ne 0 ]
  then 
    echo -e "Error: Sudo Privilege Required\n"
    echo -e "Run Command : sudo "$0" \n"
    echo "Terminating Script Execution....."
  exit
fi

apt-get check >/dev/null 2>&1
if [ "$?" -ne 0 ]; then
    echo "Error: \`apt-get check\` failed, you may have Broken Packages. Aborting.....\n"
fi

echo -e "Updating System Packages & Repositories.....\n"

sudo apt update --allow-unauthenticated -y

echo -e "\nInstalling Network-Simulator Prerequisites.....\n"

sleep 1

while read -r p ; 
    do 
    echo -e "\nInstalling $p \n" && sleep 1
    sudo apt-get install -y "$p" ; done < <(cat << "EOF"
    python3
    python3-pip
    gcc
    g++
    pkg-config
    sqlite3
    qt5-default
    mercurial
    ir1.2-goocanvas-2.0
    python3-gi
    python3-gi-cairo
    python3-pygraphviz 
    gir1.2-gtk-3.0
    ipython3
    gdb
    valgrind
    doxygen
    graphviz 
    imagemagick
    texlive
    texlive-extra-utils
    texlive-latex-extra
    texlive-font-utils
    dvipng
    latexmk
    python3-sphinx
    dia
    tcpdump
    cmake
    libc6-dev
    libc6-dev-i386
    libclang-6.0-dev
    llvm-6.0-dev
    automake
    wireshark
EOF
)

echo -e "\nInstalling cxxfilt using Python Package Manager....."

python3 -m pip install --user cxxfilt

sleep 2

echo -e "\nListing Packages Installed......\n"

apt list --installed

echo -e "\nCleaning Garbage Memory"

sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches" && echo -e "\n"

for((i = 0; i<=100; i+=5)); do
    printf "%-*s" $((i+1)) '[' | tr ' ' '#'
    printf "%*s%3d%%\r"  $((100-i))  "]" "$i"
    sleep 0.3
done; 
echo -e "\n"

echo -e "Creating Workspace Directory for NS3-Setup.....\n"

sudo mkdir workspace && sudo chmod -R 777 workspace/

if [ ! -d "workspace" ]; then
  echo "Error: Unable to create Workspace Directory"
  echo "Restarting Script in 5 seconds.Hit Ctrl + C to quit instantly"
  sleep 5 && sudo $0
fi

cd workspace/

echo "\nPresent Working Directory : " "$(pwd)"
echo -e "\nDownloading NS3 Setup from Origin.....\n"

sudo wget https://www.nsnam.org/releases/ns-allinone-3.32.tar.bz2 -O ns-allinone-3.32.tar.bz2

if [[ "$?" == 0 ]]; then
    echo -e "\nSuccess: Setup Downloaded Successfully\n" && sleep 2
else
    exit 1
fi

tar -jxvf ns-allinone-3.32.tar.bz2 

if [[ "$?" == 0 ]]; then
    echo -e "\nSuccess: Setup Extracted Successfully \n" && sleep 2
else
    exit 1
fi

echo -e "\nCleaning Garbage Memory\n"

sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches" && echo -e "\n"

for((i = 0; i<=100; i+=5)); do
    printf "%-*s" $((i+1)) '[' | tr ' ' '#'
    printf "%*s%3d%%\r"  $((100-i))  "]" "$i"
    sleep 0.1
done; 

echo -e "\nChecking Network Simulator Setup......\n"

cd ns-allinone-3.32 && ls -l

echo "Present Working Directory : " "$(pwd)"
echo -e "\nBuilding Network Simulator....." && sleep 2

./build.py

if [[ "$?" == 0 ]]; then
    echo -e "\nSuccess: Build Complete Successfully......\n"
else
    exit 1
fi

echo -e "\nRunning Hello Simulator Program......\n"

cd ns-3.32/ && ./waf --run hello-simulator

echo -e "\nScript Execution Completed"
echo "Terminating Script in 3 seconds.Hit Ctrl + C to quit instantly"
sleep 3
exit 0
