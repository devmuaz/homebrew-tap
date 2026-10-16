cask "coredeck" do
  version "0.14.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "c77501cf51231fd4ae48e77e1397f42ea99ae86c9c98b841e987fdfed1c7fbbc", intel: "7fd00d2a2d6a9fce53bef127cf18ef591fec0e8c0d48d3da1ac4de495fc48970"

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
