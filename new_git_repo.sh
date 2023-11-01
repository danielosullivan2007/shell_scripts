#!/bin/bash

# Create a new synced Github Repository in current directory

# Usage: NAME.sh [reponame]
# If reponame is not specified, it will be prompted for
# Arguments:
    # reponame: Name of the repository to be created

# Requirements:
    # Github Token must be set as an environment variable
    # Github Token must have repo permissions


if [ "$GITHUB_TOKEN" = "" ]; then
  echo "GITHUB_TOKEN not set....Exiting"
  exit 1
fi


#If reponame is not specified, prompt for it
if [ "$1" = "" ]; then
  read -p "Enter Github Repository Name: " reponame
fi

# Create a directory to store the repository
mkdir "$(pwd)/$1"
cd $1
curl --user "login=$1:$GITHUB_TOKEN" \
    https://api.github.com/user/repos  \
     -d "{\"name\":\"$1\"}"

git init
git checkout -b main
echo "ADD README CONTENT" > README.md
git remote add origin https://$GITHUB_TOKEN@github.com/danielosullivan2007/$1.git
git add README.md
git commit -m "Starting Out"
echo "ABOUT TO PUSH"
git push -u origin main