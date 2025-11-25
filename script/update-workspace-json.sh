#!/usr/bin/env bash
set -euo pipefail

TAG="$1"
VERSION=$(./script/normalize.sh "$TAG")
REPO_LOWER=$(echo "$GITHUB_REPOSITORY" | tr '[:upper:]' '[:lower:]')
IMAGE="ghcr.io/${REPO_LOWER}/ghidra:$VERSION"

jq --arg ver "$VERSION" \
   --arg img "$IMAGE" \
   '.compatibility += [{
      version: $ver,
      image: $img,
      uncompressed_size_mb: 0,
      available_tags: [$ver]
   }]' ./workspaces/Ghidra/workspace.json > workspace.json.tmp

mv workspace.json.tmp ./workspaces/Ghidra/workspace.json
