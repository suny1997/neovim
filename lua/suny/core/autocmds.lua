--设置自动命令,取消在注释行按回车自动生成新行注释
vim.cmd([[
autocmd FileType * set formatoptions-=cro
]])

-- 复制时高亮
vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

--自动命令,检测到vimLeave事件和FocusGained事件时执行切换输入法命令
--只要退出编辑模式,就执行一次im-select 1033
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  callback = function()
    vim.cmd(":silent :!/mnt/d/soft/shurufa/switch/im-select.exe 1033")
  end,
})
--只要进入编辑模式,就执行一次im-select 2052
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  callback = function()
    vim.cmd(":silent :!/mnt/d/soft/shurufa/switch/im-select.exe 2052")
  end,
})
--需要在退出vim前执行一次im-select 2052
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.cmd(":silent :!/mnt/d/soft/shurufa/switch/im-select.exe 2052")
  end,
})
--聚焦vim时执行一次im-select 2052
vim.api.nvim_create_autocmd({ "FocusGained" }, {
  callback = function()
    vim.cmd(":silent :!/mnt/d/soft/shurufa/switch/im-select.exe 2052")
  end,
})
--vim不是当前窗口时,执行一次im-select 2052
vim.api.nvim_create_autocmd({ "FocusLost" }, {
  callback = function()
    vim.cmd(":silent :!/mnt/d/soft/shurufa/switch/im-select.exe 2052")
  end,
})
