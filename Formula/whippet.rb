class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v2.2.4.tar.gz"
  sha256 "ce4bcd404e459eb77a89ecd9bf9891fbb06fffd89d656248277221b2e62076f6"

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
    system "whippet", "generate", "app", "-d /tmp/test-app"
    system "whippet", "generate", "theme", "-d /tmp/test-app/wp-content/themes/test-theme"
  end
end
