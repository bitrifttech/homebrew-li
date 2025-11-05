# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Li < Formula
  desc "CLI assistant that converts natural language to shell plans using AI"
  homepage "https://github.com/bitrifttech/li"
  url "https://github.com/bitrifttech/li/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "ef29b46fe18e7728972760a6a647cfe3d7d7384bc1b2b15207eb981c33572b58"
  license "MIT"
  version "0.1.4"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "li", "--path", "."
    bin.install "target/release/li"
  end

  test do
    # Basic test that the binary runs and shows help
    system "#{bin}/li", "--help"
    # Test that it can handle a simple command (will fail due to missing API key, but proves it runs)
    output = shell_output("#{bin}/li 'test' 2>&1", 1)
    assert_match(/li CLI is initialized|OpenRouter API key/, output)
  end
end
