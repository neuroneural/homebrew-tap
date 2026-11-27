class Brainchop < Formula
  desc "Fast, zero-dependency neuroimaging segmentation and skull stripping"
  homepage "https://brainchop.org"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.1/brainchop-1.1.1-macos-arm64.tar.gz"
      sha256 "7ea849a10502b727b6cafa11ba64647a44551cce28b1a0b60517b74931baa50f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/neuroneural/brainchop-core/releases/download/v1.1.1/brainchop-1.1.1-linux-x86_64.tar.gz"
      sha256 "3223fa6ceb159f26d9e0fd5e011e193b5bc0b3d4cc1ba83449e0a59b4f6505b3"
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
