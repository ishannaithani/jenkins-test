#!/bin/bash
echo "RUNNING generate.sh script"

echo "Creating file schema.json"
echo "{name: 'test'}" > schema.json

echo "Creating file schema.js"
echo "console.log('test file generated')" > schema.js

echo "----xxxxx---- Completed file generation ----xxxxx----"

BRANCH_CODE=$(openssl rand -hex 5)
BRANCH_NAME="auto/test-${BRANCH_CODE}"

echo $BRANCH_NAME

git checkout -b "$BRANCH_NAME"
git add .
git status
git commit -m "commit from jenkins"
echo "files committed"
git status
git push origin master