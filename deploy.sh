#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

printf "\033[0;32mRunning Hugo...\033[0m\n"
# Build the project.
hugo


printf "\033[0;32Stashing artifacts...\033[0m\n"
# Go To Public folder
mv public deploy_tmp

printf "\033[0;32Cleaning directory...\033[0m\n"
rm -rf !\("deploy_tmp"\)

printf "\033[0;32Inflating stash...\033[0m\n"
mv deploy_tmp/* ./

printf "\033[0;32Cleaning stash...\033[0m\n"
rm -rf deploy_tmp

printf "\033[0;32Adding to git...\033[0m\n"
# Add changes to git.
git add --all .

printf "\033[0;32Committing...\033[0m\n"
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

printf "\033[0;32Pushing...\033[0m\n"
# Push source and build repos.
git push origin HEAD:master -f

printf "\033[0;32Resetting...\033[0m\n"
git reset --hard HEAD~
