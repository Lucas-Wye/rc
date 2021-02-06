local wezterm = require 'wezterm'
local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end
-- 字体
c.font = wezterm.font 'JetBrainsMono Nerd Font'
-- 配色
local materia = wezterm.color.get_builtin_schemes()['Everforest Light (Gogh)']
-- 更明显的滚动条
materia.scrollbar_thumb = '#cccccc'
c.colors = materia
-- 取消 Windows 原生标题栏
c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- 滚动条尺寸为 15 ，其他方向不需要pad
c.window_padding = { left = 0, right = 15, top = 0, bottom = 0 }
-- 启用滚动条
c.enable_scroll_bar = true

local launch_menu = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-nol" },
	})
	table.insert(launch_menu, {
		label = "MSYS UCRT64",
		args = { "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell bash" },
	})
	c.default_prog = {
    "cmd.exe ", "/k", "C:\\msys64\\msys2_shell.cmd -defterm -here -no-start -ucrt64 -shell bash"
    -- "powershell"
  }
end
c.launch_menu = launch_menu

return c
