#!/bin/bash

set -e

INTELLISENSE_SRC="./intellisense-src"

# Clean up the intellisense-src directory (if it exists)
if [ -d "$INTELLISENSE_SRC" ]; then
  rm -rf "$INTELLISENSE_SRC"
fi

mkdir "$INTELLISENSE_SRC"

docker compose cp "builder:/opt/devkitpro/wut" "$INTELLISENSE_SRC/wut"

# Mark the directory as read-only, as any changes don't get applied anyways
chmod -R 555 "$INTELLISENSE_SRC"
