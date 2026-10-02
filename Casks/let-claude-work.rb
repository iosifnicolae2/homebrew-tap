cask "let-claude-work" do
  version "1.3.0"
  sha256 "5d79c07c272b0e754d02ac98b3a6fd7626658f13257d7efa10825cd03c27ae5c"

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
