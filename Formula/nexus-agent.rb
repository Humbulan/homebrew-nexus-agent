class NexusAgent < Formula
  desc "Lightweight single-binary service monitor with Slack alerts"
  homepage "https://github.com/Humbulan/nexus-agent"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.2/nexus-agent-darwin-arm64"
      sha256 "2d138858092cc7f728227911440ecb98f18f10cf15118099f88555c4609996a2"
    else
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.2/nexus-agent-darwin-amd64"
      sha256 "85fd6752278cd334d617df0a811bbe2dbd6859a2b61ab5d141d36cc6764d14a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.2/nexus-agent-linux-arm64"
      sha256 "2794082c7326621cbc3b0b4f09f713303167170ded76a4ae488b8cfdbf225953"
    else
      url "https://github.com/Humbulan/nexus-agent/releases/download/v0.1.2/nexus-agent-linux-amd64"
      sha256 "c81d6ca8f3db3a79d4d7a57de32cddf67f014393f5e80d363e7086c3aa02243e"
    end
  end

  def install
    bin.install Dir["nexus-agent-*"].first => "nexus-agent"
  end

  test do
    system "#{bin}/nexus-agent", "--help"
  end
end
