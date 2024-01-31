#!/bin/sh
set -eo pipefail

DESTINATION="/"
TEMP_PATH='__temp'

if [ -d "$TEMP_PATH" ]; then
    rm -Rf "$TEMP_PATH"
fi

mkdir "$TEMP_PATH" && cd "$TEMP_PATH"

curl -L -O https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-macos-x86_64.pkg

sudo installer -pkg aws-sam-cli-macos-x86_64.pkg -target "$DESTINATION"

cd .. && rm -Rf "$TEMP_PATH"
