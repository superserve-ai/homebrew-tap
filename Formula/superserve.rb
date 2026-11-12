class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.2.0/superserve-bun-darwin-arm64"
      sha256 "16fbd0bbccd1c74e69adf86e248a9bccc2e77b691c7ebc1b3fb73c7475696c92"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.2.0/superserve-bun-darwin-x64"
      sha256 "172d649ae16529b550388e742a53c7abfb9eea19f279a5461fac6cb47d28ad91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.2.0/superserve-bun-linux-arm64"
      sha256 "d9e8588a2e9219cf0845391557c58b99dbea879b8e359cfe5c217e71fa1e0d4a"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.2.0/superserve-bun-linux-x64"
      sha256 "0d542923e2518f2bd3697530c77f974ee2d5e0ee7605f34c7e0c1a048c619891"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
