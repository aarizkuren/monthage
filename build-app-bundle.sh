#!/bin/bash
set -euo pipefail

BUILD_DIR=".build/release"
APP_DIR="Monthage.app"

# Clean up
rm -rf "${APP_DIR}"

# Create bundle structure
mkdir -p "${APP_DIR}/Contents/MacOS"
mkdir -p "${APP_DIR}/Contents/Resources"

# Copy binary and plist
cp "${BUILD_DIR}/Monthage" "${APP_DIR}/Contents/MacOS/"
cp "Resources/Info.plist" "${APP_DIR}/Contents/"
chmod +x "${APP_DIR}/Contents/MacOS/Monthage"

# Re-sign the bundle. After moving the binary into the app bundle,
# the original linker-signed signature becomes invalid, which causes
# Gatekeeper to report the app as "damaged". We ad-hoc sign the
# bundle so the signature is valid again.
echo "Re-signing app bundle..."
codesign --sign - --deep --force "${APP_DIR}"

# Verify signature
echo "Verifying signature..."
codesign -vvv "${APP_DIR}"
codesign -dvv "${APP_DIR}"

echo "App bundle built and signed: ${APP_DIR}"