cask "monthage" do
  version "0.3.6"
  sha256 "7c754e95729d4f15bcaabc8290ef3574bf0edecf2eb0918b42c12fe723440869"

  url "https://github.com/aarizkuren/monthage/releases/download/v#{version}/Monthage.app.zip"

  name "Monthage"
  desc "Menubar app showing month progress percentage"
  homepage "https://github.com/aarizkuren/monthage"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Monthage.app"
end
