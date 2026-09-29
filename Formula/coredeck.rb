class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.13.0/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "a49741c61e665c1188c8c79e7b612740a26ad6579bd8ebd4b2f788a23443dc8c",
                             intel: "13ce314994072d896c67e7175db8985e4ba600ed13a51b18f4c63cea01c0dc8c"
  license "MIT"

  depends_on :linux

  def install
    # Fonts and icons are loaded from the directory that contains the binary.
    libexec.install Dir["coredeck-linux-*/*"]
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
