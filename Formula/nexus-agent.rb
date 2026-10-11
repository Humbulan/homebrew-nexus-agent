class NexusAgent < Formula
  desc "Lightweight single-binary service monitor with Slack alerts"
  homepage "https://github.com/Humbulan/nexus-agent"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.1/nexus-agent-darwin-arm64"
      sha256 "7355ebb984f8404d6a1abb40e679c090480c59fc3ac53857264113e48f180f33"
    else
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.1/nexus-agent-darwin-amd64"
      sha256 "09af73bd656ee7c171fa36e2474ea6bdb1c1ba95bf6c80b67c894e926dd43ade"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.1/nexus-agent-linux-arm64"
      sha256 "225d97bf2fa84d25ead879b6113bd82ecd4aebb9a7460c9f8cac38e51231fb6f"
    else
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.1/nexus-agent-linux-amd64"
      sha256 "f070af7084ce0083d25eec8b3a79743fbab3331c6983e26fa97e899b4259603a"
    end
  end

  def install
    bin.install Dir["nexus-agent-*"].first => "nexus-agent"
  end

  test do
    system "#{bin}/nexus-agent", "--help"
  end
end
