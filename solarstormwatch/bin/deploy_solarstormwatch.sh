#!/bin/bash
SOLARSTORMWATCH_PATH="/home/mrniaboc/git/retirement/solarstormwatch/"
DEPLOY_PATH="s3://zooniverse-static/www.solarstormwatch.com/"
aws s3 sync "${SOLARSTORMWATCH_PATH}" "${DEPLOY_PATH}" --delete --exclude="bin/*" --exclude=".git/*" --exclude=".git*" --exclude="README.md"
