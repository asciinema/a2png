#!/usr/bin/env bash

set -e

a2png_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if which timeout 2>/dev/null; then
    if timeout --help 2>&1 | grep BusyBox >/dev/null; then
        timeout="timeout -t ${A2PNG_TIMEOUT:-30}"
    else
        timeout="timeout -k 5 ${A2PNG_TIMEOUT:-30}"
    fi
elif which gtimeout 2>/dev/null; then
    timeout="gtimeout -k 5 ${A2PNG_TIMEOUT:-30}"
else
    timeout=""
fi

$timeout node --max-old-space-size=384 "${a2png_dir}/main.js" "$@"

out=$2

if which pngquant 2>/dev/null; then
    echo "Optimizing PNG with pngquant..."
    pngquant 24 -o "${out}.q" "$out"
    mv "${out}.q" "$out"
fi

echo "Done."
