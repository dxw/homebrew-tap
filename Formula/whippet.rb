class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v2.2.0.tar.gz"
  sha256 "9c3c02dd9c854ec1b0affbed906d642ca49d22a94762f2fe110ac38f21be459b"

  depends_on "composer" => :build
  depends_on "subversion" => :build
  depends_on "php"

  def install
    system "composer", "install"

    mkdir "#{prefix}/generators"
    prefix.install Dir["generators/*"].map { |path| [path, path] }.to_h

    mkdir "#{prefix}/src"
    prefix.install Dir["src/*"].map { |path| [path, path] }.to_h

    mkdir "#{prefix}/vendor"
    prefix.install Dir["vendor/*"].map { |path| [path, path] }.to_h

    bin.install "bin/whippet"
  end

  test do
    system "whippet", "generate", "app", "-d /tmp/test-app"
    system "whippet", "generate", "theme", "-d /tmp/test-app/wp-content/themes/test-theme"
  end
end
