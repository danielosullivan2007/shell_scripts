#!/bin/bash
echo $GITHUB_TOKEN
reponame="$1"
if [ "$reponame" = "" ]; then
read -p "Enter Github Repository Name: " reponame
fi
mkdir ./$reponame
cd $reponame
curl --user "login=danielosullivan2007:$GITHUB_TOKEN" \
    https://api.github.com/user/repos  \
     -d "{\"name\":\"$reponame\"}" 

git init
echo "ADD README CONTENT" > README.md
git add README.md
git commit -m "Starting Out"
git remote add origin https://$GITHUB_TOKEN@github.com/danielosullivan2007/$reponame.git
echo "ABOUT TO PUSH"
git push -u origin main
