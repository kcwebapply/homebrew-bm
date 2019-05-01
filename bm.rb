require "formula"

HOMEBREW_BM_VERSION='1.0.0'

class Bm < Formula
  desc "manage bookmark easily on terminal"
  homepage "https://github.com/kcwebapply/bm"
  url "https://github.com/kcwebapply/bm/archive/1.0.0.tar.gz"
  sha256 "6be2b77365f2ae3cad5a4af58fbdc03728fbaaeff821114cec25c29f3a94ddbd"

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
