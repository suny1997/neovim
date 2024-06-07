return {
  -- markdown文档,预览等
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    config = function()
      local install_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app"
      local node_modules = install_path .. "/node_modules"
      if vim.fn.empty(vim.fn.glob(node_modules)) > 0 then
        vim.cmd("!cd " .. install_path .. " && npm install")
      end
      vim.g.mkdp_auto_close = 0

      -- keybinding
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview Toggle" }) -- toggle file explorer
      keymap.set("n", "<leader>mp", "<cmd>Pastify<CR>", { desc = "Markdown image paste" }) -- toggle file explorer on current file
    end,
  },
  -- 粘贴图像到markdown文档
  -- 需要python的pillow库,wl-paste
  -- sudo apt install python3-pil
  -- sudo apt install wl-clipboard
  -- 还需要借助wslg
  {
    "TobinPalmer/pastify.nvim",
    cmd = { "Pastify" },
    opts = {
      absolute_path = false,
      apikey = "",
      local_path = "/assets/imgs/",
      save = "local",
    },
  },
}
