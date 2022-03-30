class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v2.2.1.tar.gz"
  sha256 "41d9193fca902521198a2fdf8e78e0bc3f8107388c8cdc3995029836ea6f5f80"

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
