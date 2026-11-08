cask "coredeck" do
  version "0.15.1-beta.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "086ad7cfab346a880df144279354bd061cda5ad92f773c0650263899662bbad4", intel: "b4a036cee8d2dba92e07650262d3ff2d80f2f8fd5daf5a537d1c63700377f706"

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
