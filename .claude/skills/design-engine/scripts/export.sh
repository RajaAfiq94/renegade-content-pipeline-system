#!/usr/bin/env bash
# Wrapper for the design-engine export scripts. Works on a Mac and in the cloud.
# Usage: bash scripts/export.sh carousel <input.html> <output-dir> [width] [height] [scale]
#        bash scripts/export.sh png      <input.html> <output.png> [width] [height] [scale]
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
if [ ! -d node_modules/puppeteer ]; then
  PUPPETEER_SKIP_DOWNLOAD=1 npm install --no-audit --no-fund --silent
fi
# Cloud workspaces: use the preinstalled Chromium and disable the sandbox (runs as root).
if [ -z "$PUPPETEER_EXECUTABLE_PATH" ]; then
  CHROME="$(ls -d /opt/pw-browsers/chromium-*/chrome-linux/chrome 2>/dev/null | head -1)"
  if [ -n "$CHROME" ]; then
    printf '#!/bin/sh\nexec "%s" --no-sandbox "$@"\n' "$CHROME" > /tmp/chrome-nosandbox
    chmod +x /tmp/chrome-nosandbox
    export PUPPETEER_EXECUTABLE_PATH=/tmp/chrome-nosandbox
  fi
fi
MODE="$1"; shift
cd - >/dev/null
case "$MODE" in
  carousel) node "$DIR/export-carousel.js" "$@" ;;
  png)      node "$DIR/export-png.js" "$@" ;;
  pdf)      node "$DIR/export-pdf.js" "$@" ;;
  *) echo "Mode must be carousel, png or pdf"; exit 1 ;;
esac
