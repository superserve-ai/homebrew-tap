class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.6.0/superserve-bun-darwin-arm64"
      sha256 "4dd314e898427c481d8fb19253c769bc798c62efb3a119728e574c73cd3eb4ce"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.6.0/superserve-bun-darwin-x64"
      sha256 "b6fded8e6c81428c4c7cdb57e130c4bcf9931747f51852ce7c76bf23c8091c71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.6.0/superserve-bun-linux-arm64"
      sha256 "1f165e93737c99548e74ab1f646d6b700903b1887fc34bb412b3577009bb7d19"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.6.0/superserve-bun-linux-x64"
      sha256 "0229d113cf30aefd2a6c417b2024cfaaa41e8dd1f7eb08a0a9e616f3eb453374"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
