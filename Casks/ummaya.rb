# frozen_string_literal: true

cask "ummaya" do
  arch arm: "arm64", intel: "x64"

  version "0.2.23"
  sha256 arm:   "403093f99d661f205c5ae9ea7991cce8f63bc70a235a4412f4c638871ee4b606",
         intel: "9158e2bad8d4f5293e957ae26075aaa4576c1bd1c67423a3e091ced0b674815e"

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
