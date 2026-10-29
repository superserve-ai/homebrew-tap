class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.1/superserve-bun-darwin-arm64"
      sha256 "d42f13d7909defe9136999bf14361472c2de125be678e19a53e38ccfd8cf77a8"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.1/superserve-bun-darwin-x64"
      sha256 "3cc1a315b01f3e4dd772b83689c83a3b7b93d8d6a4fbbbbd14c917f511f03906"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.1/superserve-bun-linux-arm64"
      sha256 "0d6d0fc100fdbb43ad1db2c4bd45698ff132e91dac3986d1c5bed3644219a6a2"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.1.1/superserve-bun-linux-x64"
      sha256 "b812548ec3a342c66eaab54271cf831ffdd5f1d4be15d41501ec035f98f7be1f"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
