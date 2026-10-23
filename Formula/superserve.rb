class Superserve < Formula
  desc "CLI for Superserve sandboxes"
  homepage "https://superserve.ai"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.0.1/superserve-bun-darwin-arm64"
      sha256 "faf7a4e07229735cc50ce66c5212689d7aaf107a850de9cf11b5612dd805d064"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.0.1/superserve-bun-darwin-x64"
      sha256 "5324b674d5b309fb1006f18ef772aba3458e4c3087ca5f11b2daccfdbdf5f9f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.0.1/superserve-bun-linux-arm64"
      sha256 "3fbb9806d244bb2d8017ac8e3cf6b34750f2bb138fe4dd023aa17b2b44d3febb"
    else
      url "https://github.com/superserve-ai/superserve/releases/download/cli-v2.0.1/superserve-bun-linux-x64"
      sha256 "2aff3f08240af760553a1930b8b80ce70f7363af4af14a3195b4cd64b328a702"
    end
  end

  def install
    bin.install Dir.glob("superserve-*").first => "superserve"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superserve --version")
  end
end
