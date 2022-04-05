#!/bin/bash
echo "RUNNING generate.sh script"

echo "Creating file schema.json"
echo "{name: 'test'}" > schema.json

echo "Creating file schema.js"
echo "console.log('test file generated')" > schema.js

echo "----xxxxx---- Completed file generation ----xxxxx----"

BRANCH_CODE=$(openssl rand -hex 5)
BRANCH_NAME="auto/test-${BRANCH_CODE}"
GITHUB_USER="ishannaithani"
GITHUB_TOKEN="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"
destinationBranch="master"

echo $BRANCH_NAME

git config credential.username "ishannaithani"  

git checkout -b "$BRANCH_NAME"
git add .
git status
git commit -m "commit from jenkins"
echo "files committed"
git status
git push origin $BRANCH_NAME

curl --max-time 120 -X POST \
                      -u ${GITHUB_USER}:${GITHUB_TOKEN} \
                       -H "Accept: application/vnd.github.v3+json" \
                      "https://api.github.com/repos/ishannaithani/jenkins-test/pulls" \
                      -d '{
                            "title": "Automated pull request generated for ${deployEnv} against Parent PR ${CHANGE_ID}",
                            "body": "Automated pull request generated for ${deployEnv} against Parent PR ${CHANGE_ID}",
                            "head": "'"${BRANCH_NAME}"'",
                            "base": "'"${destinationBranch}"'"
                        }'