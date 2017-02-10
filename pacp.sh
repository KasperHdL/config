#!/bin/bash
set -e

echo "Pulling"
git pull
echo ""
echo "Adding"
git add --all
echo ""
echo "Commiting"
git commit -m "$1"
echo ""
echo "Pushing"
git push origin

