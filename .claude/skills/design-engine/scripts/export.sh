#!/usr/bin/env bash
# Wrapper for the design-engine export scripts. Works on a Mac and in the cloud.
# Uses Playwright and Chromium that are already installed in the cloud workspace (see browser.js).
# No npm install is run.
# Usage: bash scripts/export.sh carousel <input.html> <output-dir> [width] [height] [scale]
#        bash scripts/export.sh png      <input.html> <output.png> [width] [height] [scale]
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
MODE="$1"; shift
case "$MODE" in
  carousel) node "$DIR/export-carousel.js" "$@" ;;
  png)      node "$DIR/export-png.js" "$@" ;;
  pdf)      node "$DIR/export-pdf.js" "$@" ;;
  *) echo "Mode must be carousel, png or pdf"; exit 1 ;;
esac
