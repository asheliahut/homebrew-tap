class Deaddrop < Formula
  desc "Leech a torrent without seeding, age-encrypt it, and hand it off over iroh"
  homepage "https://deaddrop.rip"
  license "Unlicense"

  on_macos do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v1.0.0/deaddrop-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "61612e3c9c7a19d7dd5b209427ab5b81257b83a5358cb28dab6ab302f423166c"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v1.0.0/deaddrop-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "7361f37a317457b8660b4bc3cc5741b13fe6d9af702e0165251ea19343f6ec18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v1.0.0/deaddrop-v1.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "91e601f3633c90ee6a0a9bc09654c06cf21dcaa0deee73a26d527c9391f019f7"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v1.0.0/deaddrop-v1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f6846f641938c4b4a83cb96791f4812a7426c12a8a31fc83b44c4e673ee2b48c"
    end
  end

  def install
    bin.install "deaddrop"
    pkgshare.install "config.example.toml"
    generate_completions_from_executable(bin/"deaddrop", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deaddrop --version")
  end
end
