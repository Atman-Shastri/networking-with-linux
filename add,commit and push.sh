#!/bin/bash
DATE=$(date +"%dd-%mm-%yyyy")
current_time=$(date +"%hh:%mm:%ss")
am_pm=$(date +"%p")

git config user.name "Atman-Shastri"
git config user.email "atmanshastri@gmail.com"
git add .
git commit -m "$(date) $(current_time) $(am_pm)"
git push

