# Archaic-Atom Homebrew tap

MIT-licensed Homebrew formulae maintained by the Archaic-Atom team.

## AtomX

[AtomX](https://github.com/Archaic-Atom/atomx) is a keyboard-first terminal
workspace for Codex sessions, with live usage, subagents, reply copying and images.

```sh
brew tap Archaic-Atom/tap
brew trust --formula Archaic-Atom/tap/atomx  # Homebrew 7+ only
brew install Archaic-Atom/tap/atomx
```

On older Homebrew versions, omit the trust command. The fully qualified
`brew install Archaic-Atom/tap/atomx` command also adds the tap automatically.
Install and sign in to the official Codex CLI separately (`codex login`), then
run `atomx`. Run `atomx --demo` to try the interface without Codex or model calls.

```sh
brew update
brew upgrade atomx
```

Supports Homebrew on macOS and Linux. Windows users can install from the
[AtomX repository](https://github.com/Archaic-Atom/atomx#install-and-run).
This is a team-maintained tap; it is not part of `homebrew/core`.

## Development

The formula installs pinned Python resources in a private virtual environment.
Every source archive has a SHA-256 checksum. Releases use the tagged AtomX source
archive, not the moving master branch. CI installs and runs an offline UI smoke
test on macOS and Linux without contacting Codex.

```sh
brew install --build-from-source Archaic-Atom/tap/atomx
brew test Archaic-Atom/tap/atomx
```

For each new release, update the source URL, version, checksum and any changed
resources in `Formula/atomx.rb`, then run the installation and test before merging.

## 中文

这是 Archaic-Atom 团队维护的 Homebrew 软件源，支持 macOS 和 Linux。
按上方命令安装后运行 `atomx`；Codex CLI 需要单独安装并登录。
使用 `brew update` 和 `brew upgrade atomx` 更新。
