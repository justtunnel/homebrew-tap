class Justtunnel < Formula
  desc "Expose your local services to the internet with a public URL"
  homepage "https://justtunnel.dev"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-arm64"
      sha256 "d23e9a45e5dedaff05e278ca210391ddac62f9336bc949abb0edbfd49062847d"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-amd64"
      sha256 "31fa403f6bf5e38fda55ef65390491effd099506da02b72e5cc027c5e0ae6bae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-arm64"
      sha256 "e714e34fcbe2bc635f9c1fb428dd1eaa72b9a9793d5ad1099653e6b952560d82"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-amd64"
      sha256 "0de86e666231f521136f85970f5a28e11237d3aded6c03971e198a4c3c02eca6"
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
