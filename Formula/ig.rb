class Ig < Formula
  desc "Architecture map of a codebase, checked against the architecture you intend"
  homepage "https://github.com/mrzdevcore/intent-graph"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.1/ig-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "3a13fa9d770677812ef6a9bb3cc91dd59416a84a3459cd751f133cd634dbe268"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.1/ig-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "1801a00998ac4c43badfe2eeeaa12c48fa03a4c48626ce370d772df7ebafa8ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.1/ig-0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c54eec7ff02e282754b832dc8593742d23ab5b965a28e93fa3350fef278723f"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.1/ig-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c5bff87c8a7baf2e7beffac6e8f720bd3bf064fe148c051c3bedb88b3c60cd5"
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
