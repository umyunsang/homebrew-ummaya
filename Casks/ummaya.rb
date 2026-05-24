# frozen_string_literal: true

cask "ummaya" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "29d378a562708c5c54bdfe8d2329beb1cfefb1a8a2bb5afc5be597b69ab8e31c",
         intel: "02cdde0a1b56735204c9ac0a126de619d9adf94dcce3daeaa00a695a4a45e0d9"

  url "https://ummaya-docs.pages.dev/downloads/homebrew/v#{version}/ummaya-#{version}-macos-#{arch}.tar.gz"
  name "UMMAYA"
  desc "Conversational multi-agent harness for Korean public-service channels"
  homepage "https://ummaya-docs.pages.dev/"

  livecheck do
    url "https://ummaya-docs.pages.dev/downloads/homebrew/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on :macos
  depends_on formula: "uv"

  binary "ummaya"

  zap trash: "~/.ummaya"
end
