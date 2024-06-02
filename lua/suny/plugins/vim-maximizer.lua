-- 窗口最大化和最小化
-- 比如leader+sv后使用leader+sm
return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
