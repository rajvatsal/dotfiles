from __future__ import annotations
from typing import TYPE_CHECKING

from .output_panel import OutputPanel

from .import core

import sublime
import sublime_plugin

if TYPE_CHECKING:
	from .debugger import Debugger

class TerminusIntegratedTerminal(OutputPanel):
	def __init__(self, debugger: Debugger, title: str, cwd: str, commands: list[str], env: dict[str, str|None]|None):

		# is there a better way to do this? This could mean the user customized the settings but not have terminus installed?
		settings = sublime.load_settings("Terminus.sublime-settings")
		if not settings:
			raise core.Error('Terminus must be installed to use the `console` value of `integratedTerminal`. Either install from Package control or change your debugging configuration `console` value to `integratedConsole`.')

		super().__init__(debugger, 'Debugger Terminal', 'Terminal', show_tabs=True)

		debugger.window.run_command('terminus_open', {
			'title': title or 'Untitled',
			'cwd': cwd,
			'cmd': commands,
			'env': env or {},
			'auto_close': False,
			'tag': self.output_panel_name,
			'panel_name': self.panel_name,
			'post_view_hooks': [
				['debugger_terminus_post_view_hooks', {}],
			],
		})
		self.update_settings()

	def is_finished(self):
		return self.view.settings().get('terminus_view.finished')

	def dispose(self):
		self.view.run_command('terminus_close')
		super().dispose()

class DebuggerTerminusPostViewHooks(sublime_plugin.TextCommand):
	def run(self, edit: sublime.Edit): #type: ignore
		settings = self.view.settings()
		settings.set('scroll_past_end', False)
		settings.set('draw_unicode_white_space', 'none')
