class Superserve < Formula
  desc "CLI for deploying AI agents to sandboxed cloud containers"
  homepage "https://superserve.ai"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.0/superserve-bun-darwin-arm64"
      sha256 "5697576059064d76888d70a3cac2d104a0fc89f78838fccd94c1176a072a6544"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.0/superserve-bun-darwin-x64"
      sha256 "749fd54e3f5550445256ef47ac402326dfc055d6776712ff606e494a9c16320d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.0/superserve-bun-linux-arm64"
      sha256 "a9f3cf923e01477cd02728398945fe30e74b576ec3685796443bb71fdb97234e"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.0/superserve-bun-linux-x64"
      sha256 "185d1856d2dee351d60b11c2c4e78635e1cde40b16670e450a2c0172fa23bb400cfe3ce51a218653f19a5252d77bfab5c5ff9cb0cbf7f1a2a98d2599ca9153dd"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match "superserve", shell_output("#{bin}/superserve --help")
  end
end
