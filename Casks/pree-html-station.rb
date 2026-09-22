cask "pree-html-station" do
  version "1.5"
  sha256 "e9f471de97c55426504a22f3dbf2a035f462ec08670e55c0851b6bcf76b7b59d"

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
