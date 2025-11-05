#!/bin/bash

# Homebrew Tap Setup Script for li
# This script helps set up the homebrew-li tap repository

set -e

echo "🍺 Setting up Homebrew tap for li..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Please install Homebrew first:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

echo "✅ Homebrew found"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

echo "✅ Git found"

# Use current directory as the tap directory
TAP_DIR="$(pwd)"

echo "📁 Tap directory: $TAP_DIR"

# Initialize git repository if not already done
if [ ! -d "$TAP_DIR/.git" ]; then
    git init
    git add .
    git commit -m "Initial commit: Add li formula"
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

# Instructions for setting up the tap
echo ""
echo "🚀 Next steps to publish your Homebrew tap:"
echo ""
echo "1. Create a new GitHub repository:"
echo "   https://github.com/new"
echo "   Repository name: homebrew-li"
echo "   Make it public"
echo ""
echo "2. Add remote and push:"
echo "   git remote add origin git@github.com:bitrifttech/homebrew-li.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Test the tap (after pushing to GitHub):"
echo "   brew tap bitrifttech/homebrew-li https://github.com/bitrifttech/homebrew-li.git"
echo "   brew install li"
echo ""
echo "4. For public release (after creating a GitHub release):"
echo "   - Update the sha256 in li.rb"
echo "   - Bump version if needed"
echo "   - Commit and push changes"
echo ""
echo "📋 Formula file: $TAP_DIR/li.rb"
echo "📖 README file: $TAP_DIR/README.md"
echo ""
echo "✅ Homebrew tap setup complete!"
