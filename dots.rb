class Dots < Formula
  desc "Dotfiles management tool with version control integration"
  homepage "https://github.com/SigBaldi/dots"
  url "https://github.com/SigBaldi/dots/archive/v0.1.0.tar.gz"
  sha256 "82fbd13f929f78ca2fb84043474d64ccf4a26e36cd736ded4099a95883af03b9"
  license "MIT"

  depends_on "git"
  depends_on :macos
  uses_from_macos "zsh"

  def install
    bin.install "bin/dots"
    man1.install "man/dots.1"
    zsh_completion.install "completions/_dots"
  end

  test do
    system "#{bin}/dots", "--help"
  end
end