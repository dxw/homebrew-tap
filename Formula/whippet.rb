class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v2.2.3.tar.gz"
  sha256 "4ca61bb1194e3e70758f96a1d4eda5a37d4217dfe9a20c93a1963029c2b25d89"

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
