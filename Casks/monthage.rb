cask "monthage" do
  version "0.3.1"
  sha256 "5c4f3918b64ca03f3a8d745b581dc7d05f2c5e02f878fb50ac55e8768c7d483b"

  url "https://github.com/aarizkuren/monthage/releases/download/v#{version}/Monthage.app.zip"

  name "Monthage"
  desc "Menubar app showing month progress percentage"
  homepage "https://github.com/aarizkuren/monthage"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Monthage.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Monthage.app"],
                   sudo: false
  end
end
