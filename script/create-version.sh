#!/usr/bin/env bash
set -euo pipefail

TAG="$1"
VERSION=$(./script/normalize.sh "$TAG")
FOLDER="workspaces/Ghidra $VERSION"

REPO_LOWER=$(echo "$GITHUB_REPOSITORY" | tr '[:upper:]' '[:lower:]')

mkdir -p "$FOLDER"

# Render Dockerfiles
sed "s|{{VERSION}}|$VERSION|g" templates/Ghidra/Dockerfile.template.1.17 > "$FOLDER/Dockerfile.1.17"
sed "s|{{VERSION}}|$VERSION|g" templates/Ghidra/Dockerfile.template.1.18 > "$FOLDER/Dockerfile.1.18"

# Render workspace.json (two compatibility entries already in template)
sed \
  -e "s|{{VERSION}}|$VERSION|g" \
  -e "s|{{REPO}}|$REPO_LOWER|g" \
  templates/Ghidra/workspace.json.template \
  > "$FOLDER/workspace.json"

# Copy icon
cp templates/Ghidra/ghidra.png "$FOLDER/icon.png"
cp templates/Ghidra/custom_startup.sh "$FOLDER/custom_startup.sh"
cp templates/Ghidra/ghidra.desktop "$FOLDER/ghidra.desktop"

echo "Created version folder: $FOLDER"