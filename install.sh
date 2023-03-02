#!/bin/bash
tput setaf 9
echo "Test pyramid Installation started"
tput setaf 2
git_hook_path="$HOME/.git-template/hooks123"
git_pre_commit_file="$git_hook_path/pre-commit"

if [ -d "$git_hook_path" ]; then
  echo -n "git hook path present - "
  echo "$git_hook_path"
else
  echo "git hook path NOT present, creating one - " "$git_hook_path"
  mkdir -p "$git_hook_path"
fi

git config --global core.hooksPath "$HOME/.git-template/hooks"

if [ -f "$git_pre_commit_file" ]; then
  echo "git pre-commit hook file already present, appending the tp script content into - " "$git_pre_commit_file"
  cat tp >> "$git_pre_commit_file"
  chmod +x "$git_pre_commit_file"
else
  echo "git pre-commit hook file not present, creating one - " "$git_pre_commit_file"
  cat tp >> "$git_pre_commit_file"
  chmod +x "$git_pre_commit_file"
fi
tput setaf 9
echo "Test pyramid Installation ended"
tput setaf 2