#!/usr/bin/env bash
set -euo pipefail
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT
wget -q -O - https://archive.kali.org/archive-key.asc | gpg --dearmor | tee "$TMPDIR/kali-archive-keyring.gpg" >/dev/null
test -s "$TMPDIR/kali-archive-keyring.gpg"
