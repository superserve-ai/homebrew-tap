class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.5.0/superserve-bun-darwin-arm64"
      sha256 "ed75d114336c74b412bfac85aa0be7537837e7785498c2597530df46e9307ee6"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.5.0/superserve-bun-darwin-x64"
      sha256 "9af92c54f20b4e97480748bb36f1d4470fd73dce5cbb3a1b3c908da658ed8281"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.5.0/superserve-bun-linux-arm64"
      sha256 "accc4c728433fbe5280fb2fc8856af8d56211b627eec6e6d25d49594d3130a4e"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.5.0/superserve-bun-linux-x64"
      sha256 "f4eaf5303f29b8c9e590c196572ece06afbc03714599346ff2887d784a322ec1"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
