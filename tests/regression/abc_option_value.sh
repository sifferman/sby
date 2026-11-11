#!/bin/bash
set -e

# --keep-going takes no value, so --keep-going=yes is not a valid option and
# SBY must name the whole argument and stop.
status=0
python3 "$SBY_MAIN" -f "$SBY_FILE" || status=$?
[ "$status" -eq 1 ]
grep -q "Unexpected ABC engine option '--keep-going=yes'" "$WORKDIR/ERROR"
