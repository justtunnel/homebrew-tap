class Justtunnel < Formula
  desc "Expose your local services to the internet with a public URL"
  homepage "https://justtunnel.dev"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-arm64"
      sha256 "8fbd7c2f3184470872c05c1f45f778ba4a3204c515c41cd818d5be27b97fef96"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-amd64"
      sha256 "3d3a7beed0f9ce7daa311bb22395cf2522728e4a4fdeb80fd17f20e1df1325aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-arm64"
      sha256 "0f998dd4e7b924ce665de61f16fd3b10b0069c5c0b7ea67173d63486ee71feb0"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-amd64"
      sha256 "b3844a51146a0720828716d248d9196a59baed3221393963423acef04f3c79c9"
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
