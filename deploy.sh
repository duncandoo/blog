#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

#Build site now
hugo 

#move to the public directory to commit that
cd ./public

git add .

msg="rebuild of site on `date`"
if [ $# -eq 1 ]
	then msg="$1"
fi

git commit -m "$msg"
git push origin master

#go back up to the development directory to commit that too
cd ..

git add .

git commit -m "$msg"