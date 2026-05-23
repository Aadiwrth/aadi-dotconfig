#!/usr/bin/env bash
set -euo pipefail

# glyphs
bar="▁▂▃▄▅▆▇█"
dict="s/;//g"
for ((i = 0; i < ${#bar}; i++)); do
  dict+=";s/$i/${bar:$i:1}/g"
done

# runtime dir
RUNTIME_DIR="${XDG_RUNTIME_DIR:-/tmp}"
PIDFILE="$RUNTIME_DIR/waybar-cava.pid"

# single instance
if [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  kill "$(cat "$PIDFILE")" 2>/dev/null || true
fi
echo $$ >"$PIDFILE"

# temp cava config
CONFIG="$(mktemp "$RUNTIME_DIR/waybar-cava.XXXX.conf")"

cleanup() {
  rm -f "$CONFIG" "$PIDFILE"
}
trap cleanup EXIT INT TERM

cat >"$CONFIG" <<EOF
[general]
bars = 18
framerate = 30

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# run cava → convert → force unbuffered output
exec cava -p "$CONFIG" | sed -u "$dict"
