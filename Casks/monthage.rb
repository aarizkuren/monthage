cask "monthage" do
  version "0.3.4"
  sha256 "b51c705ca4f873af6201683456be23f3e083e34079ac8f9bc31db334989cfd58"

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
