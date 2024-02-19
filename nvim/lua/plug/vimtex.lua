if vim.fn.has('win32') == 1 then
    -- latex语法风格
    vim.g.tex_flavor='latex'

    -- Windows
    vim.g.vimtex_view_general_viewer = 'SumatraPDF'
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    vim.g.vimtex_view_general_options_latexmk = '-reuse-instance'

    -- 关闭编译错误的自动弹出错误窗口
    vim.g.vimtex_quickfix_mode=0
    -- 监测及编译：\ll

    -- conceal
    vim.o.conceallevel=0
    vim.g.tex_conceal='abdmg'
end
