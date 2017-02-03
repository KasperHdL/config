#!/bin/bash
set -e

echo "Pushing"
git pull
echo ""
echo "Adding"
git add --all
echo ""
echo "Commiting"
git commit -m "$1"
echo ""
echo "Pusing lalalal"
git push origin

