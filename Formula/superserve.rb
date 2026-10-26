class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.0/superserve-bun-darwin-arm64"
      sha256 "cc5c50e651e2d98032b18ec87c5d39b1340e21c681aceec271b490d166fffddd"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.0/superserve-bun-darwin-x64"
      sha256 "a7ee4f92b574bed00541a911f60967881bda126112a0063acde96cf8b3bcffd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.0/superserve-bun-linux-arm64"
      sha256 "5fbdc6212082e5b48c60f8fb7a39c84c1cb02fdd8e1c366d0d01807fadd4c427"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.0/superserve-bun-linux-x64"
      sha256 "f54dc9cca8ee519a98f3cfea0b9ad74b0bfabd4316e81d51c39ce7d20204a0f2"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
