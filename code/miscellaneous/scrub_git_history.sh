#!/bin/sh
git checkout --orphan latest_branch
git add -A
git commit -am "clean git history"
git branch -D master
git branch -m master
git push -f origin master
echo "Done! Git history has been scrubbed"
