class Brainchop < Formula
  desc "Fast, zero-dependency neuroimaging segmentation and skull stripping"
  homepage "https://brainchop.org"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.2/brainchop-1.1.2-macos-arm64.tar.gz"
      sha256 "f8b8657352f267fc71d18668be0bb7606bbba3a2a43f5a39e38b19858294c2a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.2/brainchop-1.1.2-linux-x86_64.tar.gz"
      sha256 "85af58a30217fbb42a29058d817fc63378526d588bec76ae022f19fc1b2f4e0d"
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
