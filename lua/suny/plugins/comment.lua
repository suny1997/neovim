-- keymap: gc + ..
-- 比如: 
-- 全部注释,gc+G
-- 注释单行,gc+c
-- 取消注释,就再按一次
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx,jsx,svelte,html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
