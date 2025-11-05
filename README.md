# homebrew-li

Homebrew tap for the **li** CLI tool - AI-powered terminal assistant.

## Installation

```bash
# Add the tap
brew tap bitrifttech/homebrew-li

# Install li
brew install li
```

## What is li?

**li** is a lightweight terminal assistant that converts natural language to shell commands. Just type plain English like "make a new git repo" and li will generate a safe, minimal command plan for you to review and execute.

### Key Features

- 🧠 Natural language to shell commands
- 🛡️ Safe execution with preview before running
- 🎯 Smart classification of input
- 💬 Direct AI chat with `--chat` flag
- 🔧 Interactive setup with `li --setup`
- 🎨 Visual separators for command output
- 📋 Model selection from OpenRouter's free models
- 🪝 Optional shell hook integration

## Quick Start

After installation:

```bash
# Interactive setup
li --setup

# Try it out
li 'list files in current directory'
li 'create a new git repository'
li --chat 'what is the capital of France?'

# For help
li --help
```

## Requirements

- macOS or Linux
- OpenRouter API key (get free at https://openrouter.ai/)
- Rust toolchain (installed automatically by Homebrew)

## Configuration

li stores configuration in `~/.li/config`:

```json
{
  "openrouter_api_key": "sk-or-v1-your-api-key",
  "timeout_secs": 30,
  "max_tokens": 2048,
  "classifier_model": "nvidia/nemotron-nano-12b-v2-vl:free",
  "planner_model": "minimax/minimax-m2:free"
}
```

## Usage Examples

```bash
# File operations
li 'list all files including hidden ones'
li 'create a backup of this directory'
li 'find all Python files in current folder'

# Git operations
li 'initialize a new git repository'
li 'add all files and make initial commit'
li 'create a new branch called feature-x'

# System information
li 'show system disk usage'
li 'list all mounted drives'
li 'check system memory usage'

# Direct AI chat
li --chat 'explain quantum computing simply'
li --chat 'help me understand docker'
```

## Shell Integration (Optional)

For seamless experience, install the zsh hook:

```bash
# Install hook
li install

# Restart shell
source ~/.zshrc

# Now type natural language directly in terminal!
# "show all files" → routes through li
# "ls -la" → executes directly
```

## Troubleshooting

### "Command not found"
```bash
# Ensure Homebrew is in your PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc
```

### API Key Issues
```bash
# Set up your API key
li --setup

# Or set manually
li config --api-key sk-or-v1-your-key
```

### Update li
```bash
brew upgrade li
```

### Uninstall
```bash
brew uninstall li
brew untap bitrifttech/homebrew-li
rm -rf ~/.li  # Remove configuration
```

## Development

To install from local source:

```bash
git clone https://github.com/bitrifttech/li.git
cd li
brew install --formula ./li.rb
```

## License

MIT License - see the [li repository](https://github.com/bitrifttech/li) for details.

## Support

- 📖 [Documentation](https://github.com/bitrifttech/li/tree/main/documentation)
- 🐛 [Issues](https://github.com/bitrifttech/li/issues)
- 💬 [Discussions](https://github.com/bitrifttech/li/discussions)

---

Made with ❤️ by the bitrifttech team
