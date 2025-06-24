#!/usr/bin/env bash

BRANCH_NAME=${1:-$(git rev-parse --abbrev-ref HEAD)}
# The regex pattern
PATTERN= '^(master|main|develop){1}$|^(feature|fix|hotfix|release/enhancement)\/.+$'

if [[ "$BRANCH_NAME" =~ $PATTERN ]]; then
   echo "Branch name '$BRANCH_NAME' is valid."
   exit 0
else
   echo "Branch name '$BRANCH_NAME' is invalid. It must match the pattern: $PATTERN"
   exit 1
fi