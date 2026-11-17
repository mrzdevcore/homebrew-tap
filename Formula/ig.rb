class Ig < Formula
  desc "Architecture map of a codebase, checked against the architecture you intend"
  homepage "https://github.com/mrzdevcore/intent-graph"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.0/ig-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "122509a793a661681b28e2bcb96f4320b022db47eda608a611774dd7368c3762"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.0/ig-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3a48e4c35aa09978df0c7edaa1c0b35c714f2df580cd21686cad3be9fe669618"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.0/ig-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "627aec8b9240e94e70dddb0b9ff5bde3384f2ff74ac5dad107272b2918eff1d6"
    end
    on_intel do
      url "https://github.com/mrzdevcore/intent-graph/releases/download/v0.1.0/ig-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "167f4afba24028f7c193d51e02cdd74b2cf862356d736b47473e2308654e8b7c"
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
