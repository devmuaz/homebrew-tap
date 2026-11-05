class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.15.0/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "4a126211825e06291f095a59cec8d70b6add39c54c04e9f80f7429dec2986ff5",
                             intel: "21d545acd75d6d7513910f82e19d334888abc6b231d53e99fabd9c98511e857d"
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
