#!/bin/bash
tput setaf 9
echo "Test pyramid UnInstallation started"
tput setaf 2
git_pre_commit_file="$HOME/.git-template/hooks/pre-commit"

if [ -f "$git_pre_commit_file" ]; then
  tp_count=$(grep -c "tp-scanner" "$git_pre_commit_file")
  if [ "$tp_count" -gt 0 ]; then
    sed -i "" '/tp-scanner/d'  $git_pre_commit_file
    sed -i "" '/########## test pyramid scan ##########/d' $git_pre_commit_file
  else
    echo "tp-scanner not present in pre-commit file ($git_pre_commit_file) - nothing to uninstall"
  fi
else
  echo "git pre-commit hook file not present ($git_pre_commit_file) - nothing to uninstall"
fi

tput setaf 9
echo "Test pyramid UnInstallation ended"
tput setaf reset
