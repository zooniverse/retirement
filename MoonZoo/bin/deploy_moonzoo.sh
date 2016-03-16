#!/bin/bash
MOONZOO_PATH="/home/mrniaboc/git/retirement/MoonZoo/"
DEPLOY_PATH="s3://zooniverse-static/www.moonzoo.org/"
aws s3 sync "${MOONZOO_PATH}" "${DEPLOY_PATH}" --delete --exclude="bin/*" --exclude=".git/*" --exclude=".git*" --exclude="README.md"
