cask "coredeck" do
  version "0.10.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "10aec5d717621cdc6ab1d24e488ad1775d4a44436e6b0dc898c6b0c7d03495fa", intel: "054361be848f76d75c395cea4fc8b2687d6beb403764d41f9c581e1c4eca2e95"

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
