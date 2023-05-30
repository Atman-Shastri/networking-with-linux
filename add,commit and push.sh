#!/bin/bash

current_time=$(date +"%I:%M:%S %p")

git config user.name "Atman-Shastri"
git config user.email "atmanshastri@gmail.com"
git add .
git commit -am "$(date) $(current_time)"
git push

