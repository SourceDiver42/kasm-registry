#!/usr/bin/env bash
set -euo pipefail

tags=$(./script/get-ghidra-releases.sh)
missing=()

for tag in $tags; do
    version=$(./script/normalize.sh "$tag")
    folder="workspaces/Ghidra $version"
    if [ ! -d "$folder" ]; then
        missing+=("$tag")
    fi
done

printf '%s\n' "${missing[@]}"
