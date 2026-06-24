class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/refs/tags/v2.9.2.tar.gz"
  sha256 "e492a80616160b74e65fd253eebc91c58ac20d96bd9ecce4bac81e715a925553"

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
