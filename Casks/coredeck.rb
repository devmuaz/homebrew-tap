cask "coredeck" do
    version "0.10.0-beta.5"
    sha256 "32e4877f4b859a45417d297782aadc97ee39c553f2eb84721cff86805be19878"
  
    url "https://github.com/devmuaz/CoreDeck/releases/download/v#{version}/coredeck-darwin-arm64.dmg"
    name "CoreDeck"
    desc "GUI for Android SDK emulator, avdmanager, and sdkmanager"
    homepage "https://coredeck.dev/"
  
    depends_on macos: :monterey
  
    app "CoreDeck.app"
  
    zap trash: [
      "~/.config/coredeck",
      "~/Library/Application Support/CoreDeck",
      "~/Library/Preferences/com.devmuaz.coredeck.plist",
    ]
  end
  