class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v2.1.0.tar.gz"
  sha256 "d2dd92f582cc50f1c6d6d98aaab4c1b6308411779c6b2245e8518bc2858885ba"

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
