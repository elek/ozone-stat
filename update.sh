#!/usr/bin/env bash
jupyter nbconvert --execute --no-input --to markdown github-contributions.ipynb
sed -i '/^<style/,/<\/style/d' github-contributions.md
