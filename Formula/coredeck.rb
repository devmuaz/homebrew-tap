class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.15.1-beta.1/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "4983167b3b92f3ac6da07de3d72e1ff12d470cba0d38eed174659909672b2c53",
                             intel: "93a1882a5ebcea96fcf7833492e3eb5451a98b4c463a0863aa9e3c4b637de59d"
  license "MIT"

  depends_on :linux

  def install
    # Fonts and icons are loaded from the directory that contains the binary.
    # Homebrew already enters the tarball's single top-level directory when staging.
    libexec.install "CoreDeck", "assets"
    libexec.install "crashpad_handler" if File.exist?("crashpad_handler")
    bin.install_symlink libexec/"CoreDeck" => "coredeck"

    desktop = "share/applications/com.devmuaz.coredeck.desktop"
    if File.exist?(desktop)
      # A desktop session does not search the Homebrew prefix, so Exec must be absolute.
      inreplace desktop, "Exec=coredeck", "Exec=#{opt_bin}/coredeck"
      share.install "share/applications", "share/icons"
    else
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
  end

  def caveats
    <<~EOS
      Launch CoreDeck from a graphical session:
        coredeck

      The application menu sees Homebrew only when its share directory is on
      XDG_DATA_DIRS. Add this to ~/.profile, then sign out and back in:

        export XDG_DATA_DIRS="#{HOMEBREW_PREFIX}/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

      The Linux build requires glibc 2.38 or newer (Ubuntu 24.04 or newer).
    EOS
  end

  test do
    assert_predicate libexec/"CoreDeck", :executable?
    assert_path_exists libexec/"assets/icons/icon.png"
    assert_path_exists libexec/"assets/fonts/JetBrainsMono-Regular.ttf"

    desktop = share/"applications/com.devmuaz.coredeck.desktop"
    if desktop.exist?
      contents = desktop.read
      assert_match "Exec=#{opt_bin}/coredeck", contents
      assert_match "StartupWMClass=com.devmuaz.coredeck", contents
      assert_path_exists share/"icons/hicolor/256x256/apps/com.devmuaz.coredeck.png"
    else
      assert_path_exists share/"applications/coredeck.desktop"
    end
  end
end
