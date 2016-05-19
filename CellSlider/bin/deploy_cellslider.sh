#!/bin/bash
CELLSLIDER_PATH="/home/mrniaboc/git/retirement/CellSlider/"
DEPLOY_PATH="s3://zooniverse-static/www.cellslider.net/"
aws s3 sync "${CELLSLIDER_PATH}" "${DEPLOY_PATH}" --exclude="bin/*" --exclude=".git/*" --exclude=".git*" --exclude="README.md"
