cask "coredeck" do
  version "0.15.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "d87508bd7b8ad63d2ff61f0d08dec0243bef551e8367472a7777904bb324bdf2", intel: "bbef28c8a56f1a4360afd599707a6e26209422e09923328844ae789eda54327f"

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
