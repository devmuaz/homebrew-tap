cask "coredeck" do
    version "0.10.0-beta.2"
    sha256 "b76e7216eeaad107cc7dca45d09543030e079fbb8f15b2ce9934669062717bc0"
  
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
  