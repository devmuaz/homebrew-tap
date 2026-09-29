cask "coredeck" do
  version "0.13.0"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "74beb0239b8e4a921b2b2cce5305da6b31c34350a8e754098538467d5dbbe5d1", intel: "06fb5a61221a778f443f2f5e0346c260fe5ba6749ea24bd3375ba6218a1bedbd"

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
