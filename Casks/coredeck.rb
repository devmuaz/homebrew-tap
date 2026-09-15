cask "coredeck" do
    version "0.9.0"
    sha256 "0eb7dcdc8ca4096cf67e653c44c581000b1ca7f77fbaed217368f0da1e50b0d1"
  
    url "https://github.com/devmuaz/CoreDeck/releases/download/v#{version}/coredeck-darwin-arm64.dmg"
    name "CoreDeck"
    desc "A native desktop application around your Android SDK’s official emulator, avdmanager, and sdkmanager binaries. Use it for everyday work without opening Android Studio. Built with C++20 and Dear ImGui."
    homepage "https://coredeck.dev"
  
    app "CoreDeck.app"
  
    zap trash: [
      "~/Library/Application Support/CoreDeck",
      "~/Library/Preferences/com.coredeck.app.plist",
    ]
  end