cask "let-claude-work" do
  version "1.2.4"
  sha256 "617a21c7c030f7246bda7568563a9769eb47307d916a86c54aca3ee8957f2ce4"

  url "https://github.com/iosifnicolae2/let-claude-work-while-you-sleep/releases/download/v#{version}/LetClaudeWork.zip"
  name "Let Claude Work While You Sleep"
  desc "Menu bar app that turns the screens off and keeps the Mac awake"
  homepage "https://github.com/iosifnicolae2/let-claude-work-while-you-sleep"

  depends_on macos: :ventura

  app "LetClaudeWork.app"

  # Not notarized by Apple: clear the "downloaded from the internet" flag so macOS lets it open.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "/Applications/LetClaudeWork.app"],
        writable_paths: ["LetClaudeWork.app"],
        writable_base:  :appdir
  end

  uninstall quit: "io.bringes.letclaudework"
end
