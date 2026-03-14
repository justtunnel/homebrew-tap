class Justtunnel < Formula
  desc "Expose your local services to the internet with a public URL"
  homepage "https://justtunnel.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-arm64"
      sha256 "fe547a4b037b4364dc4c953d1f4a286b3068eeb097e4b8bd60fe456a28b8cd02"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-amd64"
      sha256 "75110697b560ca9f9addada6d43e2df3924eebe3b68e2ff91c37f355132a3a6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-arm64"
      sha256 "ceaf2d223c360d39a5d859e7d2617e6060ae1177d26a51428e35a37cf3834c81"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-amd64"
      sha256 "30e7cfcf3cbdef23b252c1193680c63a545f84d6d686049c0d92e41ebb8a7019"
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
