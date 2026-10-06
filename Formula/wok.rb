class Wok < Formula
  desc "Neovim with thoughtful defaults"
  homepage "https://github.com/drewradcliff/wok"
  url "https://github.com/drewradcliff/wok/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "7d1a0176b90058c9588ae3f0d4d6a89e2a5db471b751620a34a2797bd868cdd2"
  license "MIT"

  depends_on "fd"
  depends_on :macos
  depends_on "neovim"
  depends_on "ripgrep"

  def install
    pkgshare.install Dir["config/*"]
    bin.install "bin/wok"
  end

  def caveats
    <<~EOS
      wok's icons need a Nerd Font in your terminal: https://www.nerdfonts.com
      Your own settings go in ~/.config/wok.lua.
    EOS
  end

  test do
    assert_match "wok #{version}", shell_output("#{bin}/wok --version")
  end
end
