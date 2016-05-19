#!/bin/bash
ANCIENTLIVES_PATH="/home/mrniaboc/git/retirement/AncientLives/"
DEPLOY_PATH="s3://zooniverse-static/www.ancientlives.org/"
aws s3 sync "${ANCIENTLIVES_PATH}" "${DEPLOY_PATH}" --delete --exclude="bin/*" --exclude=".git/*" --exclude=".git*" --exclude="README.md"
