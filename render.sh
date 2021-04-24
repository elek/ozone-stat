#!/usr/bin/env bash
set -ex
mkdir -p output
update(){
  name=$(basename $1)
  name=${name%.*}
  jupyter nbconvert --execute --no-input --to markdown --output-dir=output $1
  sed -i '/^<style/,/<\/style/d' output/$name.md
  jupyter nbconvert --execute --inplace --to notebook $1
}

for l in $(ls *.ipynb); do
   update $l
done
