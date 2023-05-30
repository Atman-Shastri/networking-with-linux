#!/bin/bash

DATE=$(date + "%dd-%mm-%yyyy")
current_time=$(date +"%I:%M:%S %p")

git config user.name "Atman-Shastri"
git config user.email "atmanshastri@gmail.com"
git add .
git commit -am "$DATE $current_time"
git push

