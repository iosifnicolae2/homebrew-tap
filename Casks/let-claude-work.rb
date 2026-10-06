cask "let-claude-work" do
  version "1.4.0"
  sha256 "9c4fc336af3336fc1d0da473bf123c7a5363d579c5642e5005e386bae6fe6160"

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
