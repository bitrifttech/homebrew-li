# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Li < Formula
  desc "CLI assistant that converts natural language to shell plans using AI"
  homepage "https://github.com/bitrifttech/li"
  url "https://github.com/bitrifttech/li/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "88885ea36c6ca4d0ee617fb3cfeb21d9ae04ae0369b12dfd41ff67d947b58314"
  license "MIT"
  version "0.1.5"

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
