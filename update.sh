#!/usr/bin/env bash
set -ex
update(){
  jupyter nbconvert --execute --no-input --to markdown $1.ipynb
  sed -i '/^<style/,/<\/style/d' $1.md
  jupyter nbconvert --execute --inplace --to notebook $1.ipynb
}
update github-contributions
update jira-contributions
update git-commits
