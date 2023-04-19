#!/bin/bash
tput setaf 9
echo "Test pyramid Installation started"
tput setaf 2
git_hook_path="$HOME/.git-template/hooks"
git_pre_commit_file="$git_hook_path/pre-commit"
git_pre_commit_file_bkp="$git_hook_path/pre-commit-bkp"
tp_script_path="$HOME/scripts"
tp_script_file="$tp_script_path/tp-scanner"

if [ -z "$1" ]; then
  echo "Tag not passed - using version from current checked out branch"
else
  git checkout tags/$1
fi

if [ -d "$git_hook_path" ]; then
  echo "git hook folder already present - " "$git_hook_path"
else
  echo "git hook folder NOT present, creating one - " "$git_hook_path"
  mkdir -p "$git_hook_path"
fi

if [ -d "$tp_script_path" ]; then
  echo "script folder already present - " "$tp_script_path"
else
  echo "script folder NOT present, creating one - " "$tp_script_path"
  mkdir -p "$tp_script_path"
fi

if [ -f "$git_pre_commit_file" ]; then
  echo "git pre-commit hook file already present - taking a backup" "$git_pre_commit_file_bkp"
  cp $git_pre_commit_file $git_pre_commit_file_bkp
else
  echo "git pre-commit hook file not present, creating one - " "$git_pre_commit_file"
fi

git config --global core.hooksPath "$HOME/.git-template/hooks"

cp tp-scanner "$tp_script_file"
chmod +x "$tp_script_file"

tp_count=$(grep -c "tp-scanner" "$git_pre_commit_file")

if [ "$tp_count" -gt 0 ]; then
  echo "tp-scanner command already placed in pre-commit"
else
  echo "########## test pyramid scan ##########" >>"$git_pre_commit_file"
  echo "$HOME/scripts/tp-scanner" >>"$git_pre_commit_file"
  echo "########## test pyramid scan ##########" >>"$git_pre_commit_file"
  echo "tp-scanner command placed into pre-commit"
fi
chmod +x "$git_pre_commit_file"

tput setaf 9
echo "Test pyramid Installation ended"
tput setaf reset
