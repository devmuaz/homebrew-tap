class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.14.2/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "3edf209730bf03056fb9e7c665552b2cc5254314778eca533dec04ee4634a02a",
                             intel: "938daeb7ddc8815b2b430fce0dafe3102bb5a9f9345da83c2ddafbbf75843639"
  license "MIT"

  depends_on :linux

  def install
    # Fonts and icons are loaded from the directory that contains the binary.
    # Homebrew already enters the tarball's single top-level directory when staging.
    libexec.install Dir["*"]
    bin.install_symlink libexec/"CoreDeck" => "coredeck"

    (share/"applications").mkpath
    (share/"applications/coredeck.desktop").write <<~EOS
      [Desktop Entry]
      Type=Application
      Name=CoreDeck
      Comment=Command center GUI for the Android SDK
      Exec=#{opt_bin}/coredeck
      Icon=#{opt_libexec}/assets/icons/icon.png
      Terminal=false
      Categories=Development;
    EOS
  end

  def caveats
    <<~EOS
      Launch CoreDeck from a graphical session:
        coredeck

      The Linux build requires glibc 2.38 or newer (Ubuntu 24.04 or newer).
    EOS
  end

  test do
    assert_predicate libexec/"CoreDeck", :executable?
    assert_path_exists libexec/"assets/icons/icon.png"
    assert_path_exists libexec/"assets/fonts/JetBrainsMono-Regular.ttf"
  end
end
