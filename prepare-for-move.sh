#!/bin/bash

# Script to prepare the homebrew-li tap for moving to its own repository
# This creates a clean, ready-to-move tap directory

set -e

echo "📦 Preparing homebrew-li tap for migration..."

TAP_DIR="$(pwd)"
TEMP_DIR="/tmp/homebrew-li-migration"

# Create temporary directory for the clean tap
echo "📁 Creating clean tap directory..."
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

# Copy essential files
echo "📋 Copying tap files..."
cp "$TAP_DIR/README.md" "$TEMP_DIR/"
cp "$TAP_DIR/li.rb" "$TEMP_DIR/"
cp "$TAP_DIR/setup.sh" "$TEMP_DIR/"
cp "$TAP_DIR/update-sha.sh" "$TEMP_DIR/"

# Make scripts executable
chmod +x "$TEMP_DIR/setup.sh"
chmod +x "$TEMP_DIR/update-sha.sh"

# Create .gitignore
echo "📝 Creating .gitignore..."
cat > "$TEMP_DIR/.gitignore" << EOF
# Backup files
*.bak
*.backup

# Temporary files
.DS_Store
*.swp
*.swo

# Logs
*.log
EOF

# Create initial git repository
echo "🔧 Initializing git repository..."
cd "$TEMP_DIR"
git init
git config user.name "li CLI"
git config user.email "cli@bitrifttech.com"

git add .
git commit -m "Initial commit: Add li CLI Homebrew tap

- Add li formula with AI-powered CLI assistant
- Include comprehensive documentation
- Add setup and maintenance scripts
- Support for macOS and Linux

Features:
- Natural language to shell commands
- Safe execution with preview
- OpenRouter AI integration
- Interactive setup
- Visual command output separators"

echo ""
echo "✅ Homebrew tap prepared for migration!"
echo ""
echo "📁 Clean tap location: $TEMP_DIR"
echo ""
echo "🚀 Next steps:"
echo "1. Copy the clean tap to your new repository:"
echo "   cp -r $TEMP_DIR /path/to/new/homebrew-li-repo"
echo ""
echo "2. Create GitHub repository:"
echo "   - Name: homebrew-li"
echo "   - Description: Homebrew tap for li CLI tool"
echo "   - Make it public"
echo ""
echo "3. Push to GitHub:"
echo "   cd /path/to/new/homebrew-li-repo"
echo "   git remote add origin git@github.com:bitrifttech/homebrew-li.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. Test the tap:"
echo "   brew tap bitrifttech/homebrew-li"
echo "   brew install li"
echo ""
echo "📋 Files included:"
ls -la "$TEMP_DIR"
echo ""
echo "🎉 Ready to move to your own repository!"
