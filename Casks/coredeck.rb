cask "coredeck" do
    version "0.10.0-beta.3"
    sha256 "be9e54e0df3c70d714b1f771b89d0a8fa19421640f328fd804d1b917bb744ed7"
  
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
  