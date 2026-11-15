class Deaddrop < Formula
  desc "Leech a torrent without seeding and hand it off peer-to-peer over iroh"
  homepage "https://deaddrop.rip"
  license "Unlicense"

  on_macos do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.1.0/deaddrop-v2.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3817067bdd057571e82bd05fcda1ac020ce650d85012029ab5d432f6622f6767"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.1.0/deaddrop-v2.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "5b681378241dd5dcc9ca7343050b9737e8548a019478ef97647cd70c443dce96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.1.0/deaddrop-v2.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cfd405039f46e86f99d39afc6871d6934b7f3709cd200e327a04751eda779c95"
    end
    on_intel do
      url "https://github.com/asheliahut/deaddrop/releases/download/v2.1.0/deaddrop-v2.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "34d8ba7967e4262fe3319b84ced7794a330156671dcae66d2022a28fb59adb64"
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
