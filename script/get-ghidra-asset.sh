#!/usr/bin/env bash
set -euo pipefail

TAG="$1"

curl -s "https://api.github.com/repos/NationalSecurityAgency/ghidra/releases/tags/$TAG" \
  | jq -r '.assets[].name' \
  | grep -E '\.zip$'
