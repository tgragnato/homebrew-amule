class Inca < Formula
  desc "API around internal and global Certificate Authority flows"
  homepage "https://github.com/immobiliare/inca/"
  url "https://github.com/immobiliare/inca.git",
    tag:      "1.5.1",
    revision: "1a22c7f7d398b2a80940ab239cc2c46329a5a666"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ENV["GOPATH"] = buildpath
    system "go", "build", *std_go_args, "-o", bin/"inca", "."
  end

  test do
    system "go", "test", "./..."
    system bin/"inca", "--help"
  end
end
