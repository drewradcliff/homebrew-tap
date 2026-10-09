class Wok < Formula
  desc "Neovim without the config"
  homepage "https://github.com/drewradcliff/wok"
  url "https://github.com/drewradcliff/wok/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e6ed2a53c56fc546d4bb9e52cc8fd8b4d516e8107a3ccd5df93843f4e46ddcd4"
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
