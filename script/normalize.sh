#!/usr/bin/env bash
set -euo pipefail

tag="$1"

clean="${tag#Ghidra_}"
clean="${clean%_build}"

echo "$clean"
