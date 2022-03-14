class DalmatianTools < Formula
  desc "CLI tools to help with working with the Dalmatian platform"
  homepage "https://github.com/dxw/dalmatian-tools"
  url "https://github.com/dxw/dalmatian-tools.git", branch: "main"

  depends_on "awscli"
  depends_on "coreutils"
  depends_on "gnupg"
  depends_on "jq"
  depends_on "oath-toolkit"
  depends_on "yq"
  depends_on "brew/homebrew-cask/session-manager-plugin"

  def install
    bin.install "bin/dalmatian"
  end

  test do
    system "dalmatian", "-l"
  end
end
