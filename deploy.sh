#!/bin/bash

if [ -z "$(git status --porcelain)" ]; then

  echo -e "\033[0;32m Deploying ...\033[0m"

  # Build the project.
  hugo
  cd public
  git add .
  msg="rebuilding site `date`"
  if [ $# -eq 1 ]
    then msg="$1"
  fi
  git commit -m "$msg"

  git push origin master

  cd ..

else
  # Cancel the deploy if there are any
  # Uncommitted changes
  echo -e "\033[0;32m Deploy Canceled [uncommited changes]...\033[0m"
  git status
fi
