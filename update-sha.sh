#!/bin/bash

# Script to update SHA256 in Homebrew formula
# Usage: ./update-sha.sh [version] [url]

set -e

VERSION=${1:-"v0.1.5"}
URL=${2:-"https://github.com/bitrifttech/li/archive/refs/tags/${VERSION}.tar.gz"}

echo "🔍 Calculating SHA256 for:"
echo "   Version: $VERSION"
echo "   URL: $URL"
echo ""

# Download and calculate SHA256
SHA256=$(curl -sL "$URL" | shasum -a 256 | cut -d' ' -f1)

echo "✅ SHA256: $SHA256"
echo ""

# Update the formula file
FORMULA_FILE="$(pwd)/li.rb"

if [ ! -f "$FORMULA_FILE" ]; then
    echo "❌ Formula file not found: $FORMULA_FILE"
    exit 1
fi

# Backup original file
cp "$FORMULA_FILE" "${FORMULA_FILE}.backup"

# Update SHA256 in the formula
sed -i.bak "s/sha256 \"[a-f0-9]*\"/sha256 \"$SHA256\"/" "$FORMULA_FILE"

# Update URL if different
sed -i.bak "s|https://github.com/bitrifttech/li/archive/refs/tags/.*\.tar.gz|$URL|" "$FORMULA_FILE"

# Update version in comments
sed -i.bak "s/v[0-9]\.[0-9]\.[0-9]/$VERSION/" "$FORMULA_FILE"

echo "✅ Updated $FORMULA_FILE"
echo ""

# Show the updated formula
echo "📄 Updated formula:"
echo "=================="
cat "$FORMULA_FILE"
echo ""

echo "🚀 Ready to commit and push:"
echo "   git add li.rb"
echo "   git commit -m \"Update to $VERSION\""
echo "   git push"
echo ""
echo "💡 Users can then install with:"
echo "   brew upgrade li"
