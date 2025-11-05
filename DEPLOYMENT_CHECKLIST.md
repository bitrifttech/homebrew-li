# Homebrew Tap Deployment Checklist

## 📋 Pre-Migration Checklist

- [x] **Formula Created** (`li.rb`)
  - [x] Proper description and homepage
  - [x] Correct dependencies (rust)
  - [x] Installation instructions
  - [x] Test cases included
  - [x] OpenRouter references updated

- [x] **Documentation Created** (`README.md`)
  - [x] Installation instructions
  - [x] Usage examples
  - [x] Configuration guide
  - [x] Troubleshooting section
  - [x] Feature highlights

- [x] **Setup Scripts Created**
  - [x] `setup.sh` - Initial repository setup
  - [x] `update-sha.sh` - SHA256 update automation
  - [x] `prepare-for-move.sh` - Migration preparation

- [x] **Migration Guide Created** (`../HOMEBREW_SETUP.md`)
  - [x] Step-by-step instructions
  - [x] Troubleshooting guide
  - [x] Maintenance procedures

## 🚀 Migration Steps

1. **Run Migration Preparation**:
   ```bash
   cd homebrew-li
   ./prepare-for-move.sh
   ```

2. **Create GitHub Repository**:
   - [ ] Repository name: `homebrew-li`
   - [ ] Description: `Homebrew tap for li CLI tool`
   - [ ] Visibility: Public
   - [ ] No README (already included)

3. **Push Clean Repository**:
   ```bash
   cd /tmp/homebrew-li-migration  # Or wherever prepare script created it
   git remote add origin git@github.com:bitrifttech/homebrew-li.git
   git branch -M main
   git push -u origin main
   ```

4. **Test Installation**:
   ```bash
   # Remove any existing tap
   brew untap bitrifttech/homebrew-li 2>/dev/null || true
   
   # Add and test new tap
   brew tap bitrifttech/homebrew-li
   brew install li
   li --help
   ```

## 📦 Post-Migration Tasks

### Initial Release Setup

- [ ] **Create First Release** in main li repository:
  - Tag: `v0.1.0`
  - Release notes with features
  - Attach source archive

- [ ] **Update Formula SHA256**:
  ```bash
   cd homebrew-li
   ./update-sha.sh v0.1.0
   git add li.rb
   git commit -m "Update to v0.1.0 with correct SHA256"
   git push
  ```

- [ ] **Test Complete Installation**:
  ```bash
   brew upgrade li
   li --setup
   li 'test command'
  ```

### Documentation Updates

- [ ] **Update Main README** to include Homebrew installation
- [ ] **Add tap link** to main repository README
- [ ] **Cross-link documentation** between repositories

### Ongoing Maintenance

- [ ] **Set up GitHub Actions** for automatic formula updates (optional)
- [ ] **Create release process** documentation
- [ ] **Monitor tap usage** through Homebrew analytics

## 🔍 Testing Checklist

### Formula Validation

```bash
# Check formula syntax
brew audit li

# Check style compliance
brew style li

# Test installation
brew install --verbose li

# Test upgrade
brew upgrade li

# Test uninstall
brew uninstall li
```

### Functionality Testing

```bash
# Basic functionality
li --help
li --version

# Setup process
li --setup

# Command execution
li 'list files'

# Chat functionality
li --chat 'test'

# Configuration
li config
```

## 📊 Success Metrics

- [ ] **Installation Success**: `brew install li` works on clean system
- [ ] **Functionality**: All li features work after Homebrew install
- [ ] **Updates**: `brew upgrade li` works correctly
- [ ] **Documentation**: Users can follow setup instructions
- [ ] **No Conflicts**: Doesn't interfere with existing Homebrew setup

## 🆘 Troubleshooting

### Common Issues and Solutions

1. **Permission Errors**:
   ```bash
   sudo chown -R $(whoami) /opt/homebrew/
   ```

2. **SHA256 Mismatch**:
   ```bash
   ./update-sha.sh v0.1.0
   ```

3. **Formula Syntax Errors**:
   ```bash
   brew audit li
   brew style li
   ```

4. **Build Failures**:
   ```bash
   brew install --verbose li
   brew doctor
   ```

## 📞 Support

- **Homebrew Documentation**: https://docs.brew.sh/
- **Formula Cookbook**: https://docs.brew.sh/Formula-Cookbook
- **Main Project Issues**: https://github.com/bitrifttech/li/issues
- **Tap Issues**: https://github.com/bitrifttech/homebrew-li/issues

## ✅ Final Verification

Before announcing the tap:

- [ ] Clean installation on macOS
- [ ] Clean installation on Linux
- [ ] Upgrade process works
- [ ] All li features functional
- [ ] Documentation is accurate
- [ ] No broken links or references

---

## 🎉 Ready to Launch!

Once all checklist items are complete, the Homebrew tap is ready for public use! 🚀
