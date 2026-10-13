class Wok < Formula
  desc "Neovim without the config"
  homepage "https://github.com/drewradcliff/wok"
  url "https://github.com/drewradcliff/wok/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "b6b56289d881d9ef5654059896e421051cce8ff5566fef9ed307957b38359e4c"
  license "MIT"

  depends_on "fd"
  depends_on :macos
  depends_on "neovim"
  depends_on "ripgrep"
  depends_on "tree-sitter-cli"

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
