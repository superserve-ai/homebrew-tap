class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.2/superserve-bun-darwin-arm64"
      sha256 "ff3d7003601ad0257c85b1e7377b45fc2587e477cd161607150bab318515bb16"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.2/superserve-bun-darwin-x64"
      sha256 "50c0083baff51345ad16be9c9fc44c9cdd7dad544f09496a3c4a00024abc9d98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.2/superserve-bun-linux-arm64"
      sha256 "e60cdaf453a2163863f0c7b5728305bf514fa2f4226d2850b82e76acb364046f"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.2/superserve-bun-linux-x64"
      sha256 "2c56d495cd7ab78ee9569ac28148edd252985acb6f94dec496540c99a1666bc7"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
