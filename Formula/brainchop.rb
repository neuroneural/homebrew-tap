class Brainchop < Formula
  desc "Fast, zero-dependency neuroimaging segmentation and skull stripping"
  homepage "https://brainchop.org"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.0.0/brainchop-1.0.0-macos-arm64.tar.gz"
      sha256 "34a493ff14af78ff85a356cff4d124a0eae147c593ba233e38fa96f8cd3ac151"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.0.0/brainchop-1.0.0-linux-x86_64.tar.gz"
      sha256 "ca1d830e7564c4731745299904f97bbbe411e5cb8fec2a3a512f1495b9ce3baf"
    end
  end

  def install
    bin.install "brainchop"
    bin.install "brainchop-mindgrab"
    bin.install "brainchop-mindmap-fast"
    bin.install "brainchop-mindmap"
    bin.install "brainchop-mindsnap"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "brainchop #{version}", shell_output("#{bin}/brainchop --version")
    list_output = shell_output("#{bin}/brainchop --list")
    assert_match "mindgrab", list_output
    assert_match "mindmap-fast", list_output
    assert_match "mindmap", list_output
    assert_match "mindsnap", list_output
  end
end
