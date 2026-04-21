cask "monthage" do
  version "1.0.0"
  sha256 :no_check

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