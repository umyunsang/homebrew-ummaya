# frozen_string_literal: true

cask "ummaya" do
  arch arm: "arm64", intel: "x64"

  version "0.2.26"
  sha256 arm:   "e316f4183eacc55c627278f30a727bf60c25a46df0014e7355f2c31f6e3afb3d",
         intel: "5f6b054847203e05d6130a6d37f722566d55b42510cc67b58d390ac177eabcbc"

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
