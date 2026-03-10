class Justtunnel < Formula
  desc "Expose your local services to the internet with a public URL"
  homepage "https://justtunnel.dev"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-arm64"
      sha256 "7db60275545e3fb1f75b51c7832952300c8ef2031ea6790c3848c1b213d8e4d1"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-darwin-amd64"
      sha256 "aad5e1361c6005d86b412119be9d04815d893b550431df0505e9266fd0c34955"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-arm64"
      sha256 "ae2e3e7369585af61a9706e569cbae419b9a57c1a8641a370581c5287cddcc22"
    end

    on_intel do
      url "https://github.com/justtunnel/justtunnel-cli/releases/download/v#{version}/justtunnel-linux-amd64"
      sha256 "eaf57c9dc56c0982b49fc917830f65d7b5bae6f44410741411269775ba06271a"
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
