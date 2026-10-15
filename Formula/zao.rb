class Zao < Formula
  desc "Zsh without the config"
  homepage "https://github.com/drewradcliff/zao"
  url "https://github.com/drewradcliff/zao/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "fzf"
  depends_on :macos
  depends_on "zoxide"
  depends_on "zsh-autosuggestions"
  depends_on "zsh-syntax-highlighting"

  def install
    pkgshare.install Dir["config/*"]
    bin.install "bin/zao"
  end

  def caveats
    <<~EOS
      Add this line to ~/.zshrc, then open a new tab:
        eval "$(zao init)"
      Your own settings go after that line.
    EOS
  end

  test do
    assert_match "zao #{version}", shell_output("#{bin}/zao --version")
    assert_match "#{opt_pkgshare}/zao.zsh", shell_output("#{bin}/zao init")
  end
end
