cask "coredeck" do
    version "0.10.0-beta.1"
    sha256 "f2e7c8d5dd13f225ac5a5246a95eeb09ea93436a56d575d1c9119b97cc1ced83"
  
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
  