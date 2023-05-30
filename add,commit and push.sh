#!/bin/bash

DATE=$(date +"%d-%m-%Y")
current_time=$(date +"%I:%M:%S %p")

git config user.name "Atman-Shastri"
git config user.email "atmanshastri@gmail.com"
git add .
git commit -am "$DATE $current_time"
git push

