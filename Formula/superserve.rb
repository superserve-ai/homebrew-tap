class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.3.0/superserve-bun-darwin-arm64"
      sha256 "c0db51236a78d39ddd3d4276c50ff141654954fedcb70ec23b3a02ce6d33307a"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.3.0/superserve-bun-darwin-x64"
      sha256 "138be7ceb37833a108b9ef3df84a6c85501005fecd8f6766c66caa280ad02a34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.3.0/superserve-bun-linux-arm64"
      sha256 "8246f8369be3a0c8dd71eb103552d3660871d4057ba404f8207a663a1b0e18ec"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.3.0/superserve-bun-linux-x64"
      sha256 "4b231d6f4276d1d3396583607b1cc98e3bc88f121ba671e64b04fd9bdedbb310"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
