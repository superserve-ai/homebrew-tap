class Superserve < Formula
  desc "CLI for deploying AI agents to sandboxed cloud containers"
  homepage "https://superserve.ai"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.1.0/superserve-bun-darwin-arm64"
      sha256 "3098fc3c83af3d055c2456f403e210b6a27005ca0379123b8d08d025e1eff106"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.1.0/superserve-bun-darwin-x64"
      sha256 "eb2c1d60dbdfb0e050e3177809747307e5bbdf41ea732b75419c1d0774a633a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.1.0/superserve-bun-linux-arm64"
      sha256 "0f054e890d9ced75465ed73b08dc785a694ea95d4919c73e2bdad9630fb3c22c"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.1.0/superserve-bun-linux-x64"
      sha256 "008cbd2ceb717f17dc6e0a5259bfe203ce485461f827022ee84195e4e7435cd5927b1882522d11457e7cb0d9a3273dad5d41a6a4037276e9d221088e105d82c2"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match "superserve", shell_output("#{bin}/superserve --help")
  end
end
