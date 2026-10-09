cask "coredeck" do
  version "0.13.2"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "b7acf13968f6637c5e4ad48f81c876534e612af001ab0b537044a6d89e619324", intel: "62ea471e8ff2f2df0a2d8655abb1d377c4283ea32609457f08c35a8601697c20"

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
