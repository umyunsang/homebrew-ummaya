# frozen_string_literal: true

cask "ummaya" do
  arch arm: "arm64", intel: "x64"

  version "0.2.18"
  sha256 arm:   "cf3910a3fbb6af512e7254348f83ee0965e9c9fb824929bccbdb0bd86eb95157",
         intel: "673c9e1d48a6fb0ce016420f4f8c5b63405a5e0631e17725adae6925850aba68"

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
