#!/bin/bash
set -e

echo "Pushing"
git pull
echo "\nAdding"
git add --all
echo "\nCommiting"
git commit -m "$1"
echo "\nPusing"
git push origin

