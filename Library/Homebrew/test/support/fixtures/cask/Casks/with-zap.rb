cask "with-zap" do
  version "1.2.3"
  sha256 "8c62a2b791cf5f0da6066a0a4b6e85f62949cd60975da062df44adf887f4370b"

  url "file://#{TEST_FIXTURE_DIR}/cask/MyFancyPkg.zip"
  homepage "https://brew.sh/fancy-pkg"

  pkg "MyFancyPkg/Fancy.pkg"

  uninstall quit: "my.fancy.package.app.from.uninstall"

  zap quit:       "my.fancy.package.app",
      login_item: "Fancy",
      script:     {
        executable: "MyFancyPkg/FancyUninstaller.tool",
        args:       ["--please"],
      },
      delete:     "~/Library/Preferences/my.fancy.app.plist"
end
