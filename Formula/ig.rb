class Ig < Formula
  desc "Architecture map of a codebase, checked against the architecture you intend"
  homepage "https://github.com/mrzdevcore/intent-graph"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.2/ig-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0fb2ab305b868182b442d5a18b10adb7a66052c2b34056b892e68896c03c604f"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.2/ig-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "fe5c38f35dc5accb32b574113b22aae4a4186799ee8382b8571ef15dd5867197"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.2/ig-0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "406ca6007d7086b97566b6775e9d6b60b99754a9dca2ebc1f5816923a527d9cc"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.2/ig-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09333e4630f2715e0f94b8cf06b08c8307ce676f515cb640b4f7c900af517e53"
    end
  end

  def install
    bin.install "ig"
    man5.install "ig-map.5" if File.exist?("ig-map.5")
    generate_completions_from_executable(bin/"ig", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ig --version")
  end
end
