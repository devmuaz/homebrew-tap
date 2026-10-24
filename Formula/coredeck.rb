class Coredeck < Formula
  desc "Command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86-64"
  url "https://github.com/devmuaz/CoreDeck/releases/download/v0.14.1/coredeck-linux-#{linux_arch}.tar.gz"
  sha256 on_arch_conditional arm:   "1ab12064827c115ed489224ba03776a9710f8f44f313ed0a07bff28759af976c",
                             intel: "a733f6ccf8aa77c5dba509193af81644a82d8af87d6001c307aa2cb8681a3dd8"
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
