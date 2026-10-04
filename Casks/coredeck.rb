cask "coredeck" do
  version "0.13.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "3e54e443b7eabadcc8cde5a8c3131bd4880931a2ec9d764bd8cb86401e044a60", intel: "8ee165e4861f4551074d24d8f3614402de00a9f469e62bb513fa8ab5ce3f23ab"

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
