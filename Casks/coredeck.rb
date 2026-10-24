cask "coredeck" do
  version "0.14.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "7d0ce40b7ae7e333ad92278a26e813bce957b1e47c09d92444c7cf331a056938", intel: "5e4a090df212e126314c266f3197024e859d81263b105c6dff16f7324df60452"

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
