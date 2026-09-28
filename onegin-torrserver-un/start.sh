#!/bin/sh
set -eu

mkdir -p "$TS_PATH" "$TS_TORRENTSDIR"

arch="$(uname -m)"

case "$arch" in
  x86_64)
    pattern='linux-amd64'
    ;;
  aarch64)
    pattern='linux-arm64'
    ;;
  armv7l|armv7*)
    pattern='linux-arm7'
    ;;
  *)
    echo "Unsupported architecture: $arch" >&2
    exit 1
    ;;
esac

binary="/opt/ts/TorrServer"
marker="/opt/ts/.matrix-tag"

if [ ! -x "$binary" ] || [ ! -f "$marker" ] || [ "$(cat "$marker")" != "$MATRIX_TAG" ]; then

  echo "Downloading ByLampa Matrix: $MATRIX_TAG"

  api="https://api.github.com/repos/bylampa/Matrix/releases/tags/$MATRIX_TAG"

  asset_url="$(
    curl -fsSL \
      -H 'Accept: application/vnd.github+json' \
      "$api" |
      jq -r --arg p "$pattern" \
      '.assets[] | select(.name | contains($p)) | .browser_download_url' |
      head -n 1
  )"

  if [ -z "$asset_url" ] || [ "$asset_url" = "null" ]; then
    echo "ERROR: binary for $MATRIX_TAG ($pattern) was not found" >&2
    exit 1
  fi

  echo "Asset: $asset_url"

  curl -fL --retry 5 --retry-delay 2 \
    "$asset_url" \
    -o "$binary.tmp"

  chmod +x "$binary.tmp"
  mv "$binary.tmp" "$binary"

  printf '%s\n' "$MATRIX_TAG" > "$marker"
fi

exec "$binary" \
  --port "$TS_PORT" \
  --path "$TS_PATH" \
  --torrentsdir "$TS_TORRENTSDIR"
