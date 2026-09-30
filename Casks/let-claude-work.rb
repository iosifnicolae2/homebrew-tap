cask "let-claude-work" do
  version :latest
  sha256 :no_check

  url "https://github.com/iosifnicolae2/let-claude-work-while-you-sleep/releases/latest/download/LetClaudeWork.zip"
  name "Let Claude Work While You Sleep"
  desc "Menu bar app that turns the screens off and keeps the Mac awake"
  homepage "https://github.com/iosifnicolae2/let-claude-work-while-you-sleep"

  depends_on macos: ">= :ventura"

  app "LetClaudeWork.app"

  # Not notarized by Apple, so clear the "downloaded from the internet" flag, then start it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/LetClaudeWork.app"]
    system_command "/usr/bin/open", args: ["#{appdir}/LetClaudeWork.app"]
  end

  uninstall quit: "io.bringes.letclaudework"
end
