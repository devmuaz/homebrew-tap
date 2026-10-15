cask "coredeck" do
  version "0.14.0-beta.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "432a9bbd84111ba6ee82f985b4b8365c4d2180378d08d70c9c5d7854bb88cb90", intel: "17665cb85d94b825c7c43566bf700d9a5bcb3b00d2b54bb7fbbd8bdacf2ed994"

  url "https://github.com/devmuaz/CoreDeck/releases/download/v#{version}/coredeck-darwin-#{arch}.dmg"
  name "CoreDeck"
  desc "A command center GUI for the Android SDK (sdkmanager, avdmanager, etc.)"
  homepage "https://coredeck.dev/"

  depends_on macos: :monterey

  app "CoreDeck.app"

  zap trash: [
    "~/.config/coredeck",
    "~/Library/Application Support/CoreDeck",
    "~/Library/Preferences/com.devmuaz.coredeck.plist",
  ]
end
