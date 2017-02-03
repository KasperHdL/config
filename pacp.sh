#!/bin/bash
set -e

git pull
git add --all
git commit -m "$1"
git push origin

