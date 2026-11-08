cask "coredeck" do
  version "0.16.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "d5202866b36efa6f1b84f0a6a7729c847efc3a392ba58b9060bd39685a1b72d7", intel: "a304b447a21d01c21336b7a25032e84aacd39295f7a2ddc4b9436549664fece7"

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
