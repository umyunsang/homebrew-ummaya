# frozen_string_literal: true

cask "ummaya" do
  version "0.1.1"
  sha256 "ebabd6242972759ece8064065aea65d10ca1087487189156012a5f11bba46585"

  url "https://registry.npmjs.org/ummaya/-/ummaya-#{version}.tgz"
  name "UMMAYA"
  desc "Conversational multi-agent harness for Korean public-service channels"
  homepage "https://github.com/umyunsang/UMMAYA"

  depends_on formula: "oven-sh/bun/bun"
  depends_on formula: "uv"

  binary "package/bin/ummaya"

  zap trash: "~/.ummaya"
end
