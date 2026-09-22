cask "pree-html-station" do
  version "1.4"
  sha256 "7951ae44f6df3ef6fdc5fdb26824e3f33793a91ac7a3af2f896010e0f6964b5e"

  url "https://github.com/hukairui228/pree-html-station/releases/download/v#{version}/PreeHTMLStation-macOS.zip"
  name "Pree HTML Station"
  desc "Tiny native macOS WYSIWYG editor for AI-agent-generated HTML"
  homepage "https://github.com/hukairui228/pree-html-station"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Pree HTML Station.app"

  postflight do
    # Ad-hoc signed build: strip quarantine so first launch skips the
    # right-click -> Open Gatekeeper dance.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pree HTML Station.app"]
  end
end
