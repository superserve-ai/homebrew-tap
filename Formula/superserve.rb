class Superserve < Formula
  desc "CLI for deploying AI agents to sandboxed cloud containers"
  homepage "https://superserve.ai"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.2/superserve-bun-darwin-arm64"
      sha256 "fa1405f0ca36261f350f99df30804fd383d0719e6f391928f1aeec5914555d2d"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.2/superserve-bun-darwin-x64"
      sha256 "5ce4b9b2c017f5d59b5e6e33fe746d2c99102a34e5fdb6104352d2f91557d31c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.2/superserve-bun-linux-arm64"
      sha256 "5cac912b7a62f833d4354454d6d8742bd71bf345e2f91dd63da396c64f91c6c0"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/v1.0.2/superserve-bun-linux-x64"
      sha256 "ed3d8e33c2c604338ee9c5091629e9a028654b5ac7a3ed9261205583f7945789a901a692498e3fce31487dd730dff93163a868385146cdb43e07d0a20c5a43b6"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match "superserve", shell_output("#{bin}/superserve --help")
  end
end
