cask "coredeck" do
    version "0.10.1"
    sha256 "10aec5d717621cdc6ab1d24e488ad1775d4a44436e6b0dc898c6b0c7d03495fa"
  
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
  