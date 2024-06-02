-- 左右横跳
-- ctrl + o 
-- ctrl + i
-- todo 注释
return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile"},
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- TODO: 按键TODO + : 生成TODO注释
    -- HACK: 按键HACK + : 生成HACK注释
    -- BUG:  按键BUG  + : 生成BUG注释
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
