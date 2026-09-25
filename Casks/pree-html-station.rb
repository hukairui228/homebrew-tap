cask "pree-html-station" do
  version "1.6"
  sha256 "37a3b835afe52fb3a1ccb6529a264ba6c9559ff28f9e580f41ffd63a3c278dd4"

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
