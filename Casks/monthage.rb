cask "monthage" do
  version "0.3.5"
  sha256 "4cac42083abef99cffe0c7116f7a221ba1798b9f5524bb4070f91cc9752b4803"

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
