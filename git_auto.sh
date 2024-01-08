#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <commit_message>"
  exit 1
fi

commit_message="$1"

git add .
git commit -m "$commit_message"
git pull
git push
