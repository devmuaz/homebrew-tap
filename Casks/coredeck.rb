cask "coredeck" do
  version "0.14.2"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "162f02e3bb1c6ad2f60c7a603203e941c8675a3560977a956ac1d1434efbadf5", intel: "dd27408c82bedb9f0373904538e1336ebb1a101b5559e3e630aa5782a4cfd11c"

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
