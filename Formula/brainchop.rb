class Brainchop < Formula
  desc "Fast, zero-dependency neuroimaging segmentation and skull stripping"
  homepage "https://brainchop.org"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.0/brainchop-1.1.0-macos-arm64.tar.gz"
      sha256 "53bd091ed2fc8ba9674fc66fd7e8ca319c44c53bde9f148f3f8b5c6686d0efbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.0/brainchop-1.1.0-linux-x86_64.tar.gz"
      sha256 "57efc0045f1261f64c874a54d036747003924393eb63b61223071e0a15cfbac0"
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
