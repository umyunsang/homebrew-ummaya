# typed: false
# frozen_string_literal: true

class Ummaya < Formula
  desc "Conversational multi-agent harness for Korean public-service channels"
  homepage "https://github.com/umyunsang/UMMAYA"
  url "https://registry.npmjs.org/ummaya/-/ummaya-0.1.1.tgz"
  sha256 "ebabd6242972759ece8064065aea65d10ca1087487189156012a5f11bba46585"
  license "Apache-2.0"

  depends_on "oven-sh/bun/bun"
  depends_on "uv"

  def install
    libexec.install Dir["*"]
    system Formula["bun"].opt_bin/"bun", "install", "--production", "--no-save", "--cwd", libexec
    (bin/"ummaya").write <<~SH
      #!/bin/bash
      export PATH="#{Formula["bun"].opt_bin}:#{Formula["uv"].opt_bin}:$PATH"
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/bin/ummaya" "$@"
    SH
  end

  def caveats
    <<~EOS
      UMMAYA uses Bun at runtime. If Homebrew cannot resolve the Bun dependency:
        brew tap oven-sh/bun
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ummaya --version")
  end
end
