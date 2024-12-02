class Dots < Formula
  desc "Dotfiles management tool with version control integration"
  homepage "https://github.com/SigBaldi/dots"
  # url "https://github.com/SigBaldi/dots/archive/v1.0.0.tar.gz"
  # sha256 "YOUR_TARBALL_SHA"
  license "MIT"

  depends_on "git"
  depends_on "neovim"
  depends_on "eza"
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