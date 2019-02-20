require "formula"

HOMEBREW_BM_VERSION='0.0.1'

class Bm < Formula
  desc "manage bookmark easily on terminal"
  homepage "https://github.com/kcwebapply/bm"
  url "https://github.com/kcwebapply/bm/archive/0.0.1.tar.gz"
  sha256 "a4c5a4d6135c33effc6abbcb2ff940867c6dd51913915a9cf83de4d92d606c3a"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    print buildpath
    ENV["GOPATH"] = buildpath
    imemo_path = buildpath/"src/github.com/kcwebapply/bm/"
    imemo_path.install buildpath.children

    cd imemo_path do
      system "dep", "ensure", "-vendor-only"
      system "go", "build"
      bin.install "bm"
    end
  end

end
