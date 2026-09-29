#!/usr/bin/env bash
# usage: r.sh <name> <width> <height>   renders src/<name>.html -> img/<name>.png
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
NAME="$1"; W="$2"; H="$3"
chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=2 --window-size="${W},${H}" \
  --screenshot="${DIR}/../img/${NAME}.png" "file://${DIR}/${NAME}.html" 2>/dev/null
echo "rendered ${NAME}.png (${W}x${H} @2x)"
