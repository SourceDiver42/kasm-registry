#!/usr/bin/env bash
set -euo pipefail

curl -s https://api.github.com/repos/NationalSecurityAgency/ghidra/releases \
  | jq -r '.[].tag_name'
