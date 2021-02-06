local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
-- you can use some built-in conditions
local cond = require('nvim-autopairs.conds')

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  enable_check_bracket_line = false,
  ignored_next_char = "[%w%.]",
  fast_wrap = {
    map = '<M-e>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    end_key = 'c',
    before_key = 'h',
    after_key = 'l',
    cursor_pos_before = true,
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    manual_position = true,
    highlight = 'Search',
    highlight_grey='Comment'
  },
})


npairs.add_rules({
  Rule("$", "$",{"tex", "latex"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  }
)

npairs.add_rules({
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
          return false
        end
    end)
   }
)

