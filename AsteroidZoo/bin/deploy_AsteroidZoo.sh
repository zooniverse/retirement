#!/bin/bash
ASTEROIDZOO_PATH="/home/mrniaboc/git/retirement/AsteroidZoo/"
DEPLOY_PATH="s3://zooniverse-static/www.asteroidzoo.org/"
aws s3 sync "${ASTEROIDZOO_PATH}" "${DEPLOY_PATH}" --delete --exclude="bin/*" --exclude=".git/*" --exclude=".git*" --exclude="README.md"
