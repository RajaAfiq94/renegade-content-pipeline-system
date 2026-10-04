#!/usr/bin/env bash
# Export smoke test. Renders a one-slide page with the local fonts and checks the PNG.
# Usage: bash .claude/skills/design-engine/scripts/smoke-test.sh <scratch-dir>
# Exit 0 = export works. Exit 1 = export is broken (infrastructure, not a design problem).
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL="$(cd "$DIR/.." && pwd)"
OUT="${1:-/tmp}/export-smoke-test"
mkdir -p "$OUT" || exit 1
cat > "$OUT/smoke.html" <<EOF
<html><head><link rel="stylesheet" href="file://$SKILL/assets/fonts/fonts.css">
<style>body{margin:0}.page{width:1080px;height:1350px;background:#0b0b0f;color:#fff;font:700 80px 'Space Grotesk';padding:80px;box-sizing:border-box}</style>
</head><body><div class="page">Smoke test</div></body></html>
EOF
rm -f "$OUT/smoke.png"
if ! bash "$DIR/export.sh" png "$OUT/smoke.html" "$OUT/smoke.png" 1080 1350 1 > "$OUT/smoke.log" 2>&1; then
  echo "SMOKE TEST FAILED: export command errored. Last log lines:"
  tail -5 "$OUT/smoke.log"
  exit 1
fi
if [ ! -s "$OUT/smoke.png" ]; then
  echo "SMOKE TEST FAILED: no PNG was written."
  exit 1
fi
SIZE="$(file "$OUT/smoke.png")"
case "$SIZE" in
  *"PNG image data, 1080 x 1350"*) echo "SMOKE TEST PASSED: $SIZE"; exit 0 ;;
  *) echo "SMOKE TEST FAILED: unexpected output: $SIZE"; exit 1 ;;
esac
