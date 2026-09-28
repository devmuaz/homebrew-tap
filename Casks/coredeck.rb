cask "coredeck" do
  version "0.12.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "8363074f819cec8155060aeeae73f0cca5e3e2c210fc02fd08756e13c7a2af41", intel: "1813349f3cdcb133e21b92bc18ed3176b54e4431946de9da4bc91f847111aa3f"

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
