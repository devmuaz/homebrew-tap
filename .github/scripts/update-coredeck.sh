#!/usr/bin/env bash
set -euo pipefail

# Remove a leading "v" (v0.9.1 -> 0.9.1).
CLEAN_VERSION="${VERSION#v}"
RELEASE_BASE="https://github.com/devmuaz/CoreDeck/releases/download/v${CLEAN_VERSION}"

is_sha256() {
  [[ "$1" =~ ^[a-fA-F0-9]{64}$ ]]
}

fetch_sha256() {
  curl -fsSL "$1" | awk '{print $1}'
}

# Keep a payload checksum when it is already valid. Otherwise download the
# checksum file published next to that release asset.
resolve_sha256() {
  local label="$1"
  local asset="$2"
  local value="$3"

  if is_sha256 "$value"; then
    printf '%s' "$value"
    return
  fi

  echo "Dispatch payload did not include a valid ${label} sha256; fetching from the GitHub release" >&2
  fetch_sha256 "${RELEASE_BASE}/${asset}.sha256" || true
}

SHA256_DARWIN_ARM64="$(resolve_sha256 "darwin arm64" "coredeck-darwin-arm64.dmg" "${SHA256_DARWIN_ARM64:-}")"
SHA256_DARWIN_X86_64="$(resolve_sha256 "darwin x86-64" "coredeck-darwin-x86-64.dmg" "${SHA256_DARWIN_X86_64:-}")"
SHA256_LINUX_ARM64="$(resolve_sha256 "Linux arm64" "coredeck-linux-arm64.tar.gz" "${SHA256_LINUX_ARM64:-}")"
SHA256_LINUX_X86_64="$(resolve_sha256 "Linux x86-64" "coredeck-linux-x86-64.tar.gz" "${SHA256_LINUX_X86_64:-}")"

if ! is_sha256 "$SHA256_DARWIN_ARM64" || ! is_sha256 "$SHA256_DARWIN_X86_64" || ! is_sha256 "$SHA256_LINUX_ARM64" || ! is_sha256 "$SHA256_LINUX_X86_64"; then
  echo "::error::Could not determine valid macOS and Linux checksums for CoreDeck v${CLEAN_VERSION}" >&2
  exit 1
fi

sed -i "s/version \".*\"/version \"$CLEAN_VERSION\"/" Casks/coredeck.rb
sed -i -E "s|(download/v)[^/]+(/coredeck-linux-)|\\1${CLEAN_VERSION}\\2|" Formula/coredeck.rb
grep -q "version \"$CLEAN_VERSION\"" Casks/coredeck.rb
grep -q "download/v${CLEAN_VERSION}/coredeck-linux-" Formula/coredeck.rb

sed -i "s/sha256 arm: \"[0-9a-fA-F]*\", intel: \"[0-9a-fA-F]*\"/sha256 arm: \"$SHA256_DARWIN_ARM64\", intel: \"$SHA256_DARWIN_X86_64\"/" Casks/coredeck.rb
sed -i -E "s/arm:[[:space:]]+\"[0-9a-fA-F]{64}\"/arm:   \"$SHA256_LINUX_ARM64\"/" Formula/coredeck.rb
sed -i -E "s/intel:[[:space:]]*\"[0-9a-fA-F]{64}\"/intel: \"$SHA256_LINUX_X86_64\"/" Formula/coredeck.rb
grep -q "$SHA256_LINUX_ARM64" Formula/coredeck.rb
grep -q "$SHA256_LINUX_X86_64" Formula/coredeck.rb
