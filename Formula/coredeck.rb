class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.14.0-beta.1/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "2995a42d3c1593e8a0b3b3c24c11f051cb11514eae697ae9b8208480e68a7f42",
                             intel: "00136f59c0230aba15fd3cf305fb1a0bf303d1744922915f3dbc7e238e55d3c7"
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
