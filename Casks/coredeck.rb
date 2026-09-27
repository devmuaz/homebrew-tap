cask "coredeck" do
  version "0.11.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "f6be934b9e91661a3d238aa9b581f64c991a2aa44c84e63ad8304f1989379be5", intel: "88098ab630b04b4e42dd10c28c7dde9ef90ac5f437aba01e93bbef48dd2db240"

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
