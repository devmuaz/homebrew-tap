cask "coredeck" do
  version "0.13.3"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "6fc13b1926100320dd16075567bcdb94e9b9a489853483138296f73972f3a9c3", intel: "a4ea47096d3e359c7c102c7adc47168197ee14f62d023eb6738724bf57e7747f"

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
