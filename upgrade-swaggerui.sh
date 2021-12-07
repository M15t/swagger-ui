#!/usr/bin/env bash

VERSION="$1"
if [[ $VERSION == "" ]]; then
  echo "ERROR: First argument (version) is required!"
  echo "Ex: $(basename $0) 4.1.2"
  exit 1
fi

set -ex

find ./* -type f -not \( -name '.git' -o -name 'upgrade-swaggerui.sh' \) -print0 | xargs -0 -I {} rm {}

curl -sLO "https://github.com/swagger-api/swagger-ui/archive/refs/tags/v$VERSION.zip"
unzip -qq -j v$VERSION.zip "swagger-ui-$VERSION/dist/*"
rm v$VERSION.zip

