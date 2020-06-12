class Whippet < Formula
  desc "Framework for building WordPress sites"
  homepage "https://github.com/dxw/whippet"
  url "https://github.com/dxw/whippet/archive/v1.0.1.tar.gz"
  sha256 "f72c7cedf66f9aa4965907ea19191bba8bf430008d891c08ab7b172b060d853a"

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
