#!/bin/sh

# We follow the process here: https://gohugo.io/hosting-and-deployment/hosting-on-github/#put-it-into-a-script-1

# The script adds the master branch as a seperate repository (It expects the remote branch to be called origin)
# Generates the site by hugo and then pushes it to the master branch in github.

echo "\033[0;32mThis script is now publishing the Hugo Content to Github\033[0m\n"

echo "You shoud be running  it after you've confirmed the site works"

# If a command fails then the deploy stops
set -e

if [ "`git status -s`" ]
then
    echo "The working directory is dirty. Please commit any pending changes.''"
    exit 1;
fi


# Get the commit message
msg=""
if [ -n "$*" ]; then
	msg="$*"
fi

echo "Deleting old publication"
rm -rf public
mkdir public
git worktree prune
rm -rf .git/worktrees/public/

echo "Checking out master branch into public...\n"
git worktree add -B master public origin/master

echo "Removing existing files...\n"
rm -rf public/*

echo "Generating site"
hugo &
pid=$!
wait $pid
echo "\033[0;32mHugo is done.\033[0m\n"

echo "Updating branch - Publishing...\n"
echo "Published by script on $(date) -  ${msg}"
cd public && git add --all && git commit -m "Published by script on $(date) -  ${msg}"

echo "Pushing to github"
git push origin master
