cask "coredeck" do
  version "0.16.1"

  arch arm: "arm64", intel: "x86-64"

  sha256 arm: "6570a35de8633976fb451cda730aa4b625d1a255b51fc847fc62fb989b42d9e3", intel: "b03ee450d5e8109601b8727f30b533fe70ad7d0cb355017e4344913eb2fc2218"

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
