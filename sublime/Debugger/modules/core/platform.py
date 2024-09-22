from __future__ import annotations

import sublime

_platform = sublime.platform()

 # CPU architecture, which may be "x32", "x64" or "arm64"
architecture = sublime.arch()

osx = _platform == 'osx'
windows = _platform == 'windows'
linux = _platform == 'linux'

is_64 = architecture.endswith('64')

# The circles aren't the same size on windows so use the triangles instead
unicode_unchecked_sigil = '◇' if windows else '◯'
unicode_checked_sigil = '◆' if windows else '●'
