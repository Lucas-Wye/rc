local wezterm = require 'wezterm'
local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
end

-- 字体
c.font = wezterm.font {
	family = 'JetBrainsMono Nerd Font',
	harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

-- 配色
local materia = wezterm.color.get_builtin_schemes()['Ef-Spring']
-- local materia = wezterm.color.get_builtin_schemes()['Solarized Light (Gogh)']

-- 关闭时不进行确认
c.window_close_confirmation = 'NeverPrompt'

-- tab_bar
c.enable_tab_bar = true
c.hide_tab_bar_if_only_one_tab = true
c.show_tab_index_in_tab_bar = false
c.tab_max_width = 25

-- 更明显的滚动条
materia.scrollbar_thumb = '#cccccc'
c.colors = materia

-- 取消 Windows 原生标题栏
c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- 滚动条尺寸为 15 ，其他方向不需要pad
c.window_padding = { left = 0, right = 15, top = 0, bottom = 0 }

-- 启用滚动条
c.enable_scroll_bar = true

-- 启动菜单的一些启动项
local launch_menu = {}
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	table.insert(launch_menu, {
		label = "PowerShell",
		args = { "pwsh.exe", "-nol" },
	})
	c.default_prog = { 
    "powershell"
  }
end
c.launch_menu = launch_menu

-- 取消所有默认的热键
c.disable_default_key_bindings = true
local act = wezterm.action
c.keys = {
  { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'Clipboard' }, 
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' }, 
  -- Ctrl+Tab 遍历 tab
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  -- Ctrl+Shift++ 字体增大
  { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
  -- Ctrl+Shift+- 字体减小
  { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
  -- Ctrl+Shift+T 新 tab
  { key = 'T', mods = 'SHIFT|CTRL', action = act.ShowLauncher },
  -- 显示启动菜单
  { key = 'Enter', mods = 'SHIFT|CTRL', action = act.ShowLauncherArgs { flags = 'FUZZY|TABS|LAUNCH_MENU_ITEMS' } },
  -- 向上滚动一页
  { key = 'UpArrow', mods = 'SHIFT|ALT', action = act.ScrollByPage(-1) },
  -- 向下滚动一页
  { key = 'DownArrow', mods = 'SHIFT|ALT', action = act.ScrollByPage(1) },
  -- 激活pane
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection("Left") },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection("Right") },
  { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection("Up") },
  { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection("Down") },
  -- 上下分屏
  { key = 'h', mods = 'SHIFT|CTRL', action = act.SplitVertical{domain="CurrentPaneDomain"} },
  -- 左右分屏
  { key = 'j', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{domain="CurrentPaneDomain"} },
}

return c
