class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.4.0/superserve-bun-darwin-arm64"
      sha256 "cb190851b53645bf4b7a5ccd4f0a0513e87e82bf5595a48ee7af6db48182e6ae"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.4.0/superserve-bun-darwin-x64"
      sha256 "7a9953c117a98bba9b3f53bd5f20f1ff2af41f6f972fbc44a8ea18dbbdd22e4c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.4.0/superserve-bun-linux-arm64"
      sha256 "4e379f9c78b5ea86fb06d980fd7742f5264425dc1f8d031a453c091b9e6f1e5f"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.4.0/superserve-bun-linux-x64"
      sha256 "61f7611b252d635777425dae67ae0588c580298d0d5d7fffcb866281a64ab6d9"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
