class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "f694126f678e6ca08c0bde056e1c5d4f2271ee224c8b946e0504e7c243935823"

  depends_on "composer" => :build
  depends_on "subversion" => :build
  depends_on "php"

  def install
    system "composer", "install"

    mkdir "#{prefix}/generators"
    prefix.install Dir["generators/*"].to_h { |path| [path, path] }

    mkdir "#{prefix}/src"
    prefix.install Dir["src/*"].to_h { |path| [path, path] }

    mkdir "#{prefix}/vendor"
    prefix.install Dir["vendor/*"].to_h { |path| [path, path] }

    bin.install "bin/whippet"
  end

  test do
    system "#{bin}/whippet", "generate", "app", "-d /tmp/test-app"
    system "#{bin}/whippet", "generate", "theme", "-d /tmp/test-app/wp-content/themes/test-theme"
  end
end
