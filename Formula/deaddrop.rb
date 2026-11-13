class Deaddrop < Formula
  desc "Leech a torrent without seeding and hand it off peer-to-peer over iroh"
  homepage "https://deaddrop.rip"
  license "Unlicense"

  on_macos do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.0.0/deaddrop-v2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "acd09db814d3ab08d347f9c36f91539b9d68957407e0ac88e0d27011f3d77d55"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.0.0/deaddrop-v2.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "290fd8cc9ca0e489f97f1d60551e9a3dd9253981e682072f9f5af4ea4c2ae623"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.0.0/deaddrop-v2.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "df0e60796134531e579d1d0c6bb87ff1e5797517b83830e719997d8a623a1783"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.0.0/deaddrop-v2.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4fe191bf206978322cba1af04f80cf569091ca74d2d8c7bbb5a801319678a706"
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
