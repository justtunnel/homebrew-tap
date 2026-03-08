class Justtunnel < Formula
  desc "Expose your local services to the internet with a public URL"
  homepage "https://justtunnel.dev"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-arm64"
      sha256 "3f5d5bc2193e556cd0f156c8a9239f4010449695aa6f85080ae0db57ae5367e6"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-amd64"
      sha256 "e0e0817e75dcf8cf177420fdc7cbd09da2233b00a5644c2d365f58f8acf5ce81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-arm64"
      sha256 "9b1201f006775fbe38a6c3da196b417ba5d443edf68659be541b9c3693b2ebd1"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-amd64"
      sha256 "e34e5ed0dbd3c27981b66e0363f559822cbbc4abdd7148c6bcac70723c46b40b"
    end
  end

  def install
    binary_name = "justtunnel-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "amd64"}"
    bin.install binary_name => "justtunnel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/justtunnel version")
  end
end
