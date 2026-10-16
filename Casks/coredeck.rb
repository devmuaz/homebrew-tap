cask "coredeck" do
  version "0.14.0-beta.2"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "df160cb7f8c89d32a469d28faff57a82a74e61585fe49eaa5f926eade8b57fb3", intel: "e3d25c20a61c5e79cc489ce39ef8bfb4509c68d3ffd4991b02e8d3ed87070e1d"

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
