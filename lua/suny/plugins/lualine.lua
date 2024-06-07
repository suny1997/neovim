-- 状态栏插件
-- 下面的状态栏显示自定义
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- config = function()
  --   local lualine = require("lualine")
  --   -- 获得lazy插件管理器的状态
  --   local lazy_status = require("lazy.status")
  --
  --   local colors = {
  --     blue = "#65D1FF",
  --     green = "#3EFFDC",
  --     violet = "#FF61EF",
  --     yellow = "#FFDA7B",
  --     red = "#FF4A4A",
  --     fg = "#c3ccdc",
  --     bg = "#112638",
  --     inactive_bg = "#2c3043",
  --   }
  --
  --   local my_lualine_theme = {
  --     normal = {
  --       a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
  --       b = { bg = colors.bg, fg = colors.fg },
  --       c = { bg = colors.bg, fg = colors.fg },
  --     },
  --     insert = {
  --       a = { bg = colors.green, fg = colors.bg, gui = "bold" },
  --       b = { bg = colors.bg, fg = colors.fg },
  --       c = { bg = colors.bg, fg = colors.fg },
  --     },
  --     visual = {
  --       a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
  --       b = { bg = colors.bg, fg = colors.fg },
  --       c = { bg = colors.bg, fg = colors.fg },
  --     },
  --     command = {
  --       a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
  --       b = { bg = colors.bg, fg = colors.fg },
  --       c = { bg = colors.bg, fg = colors.fg },
  --     },
  --     replace = {
  --       a = { bg = colors.red, fg = colors.bg, gui = "bold" },
  --       b = { bg = colors.bg, fg = colors.fg },
  --       c = { bg = colors.bg, fg = colors.fg },
  --     },
  --     inactive = {
  --       a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
  --       b = { bg = colors.inactive_bg, fg = colors.semilightgray },
  --       c = { bg = colors.inactive_bg, fg = colors.semilightgray },
  --     },
  --   }
  --
  --   -- confnigure lualine with modified theme
  --   lualine.setup({
  --     options = {
  --       theme = my_lualine_theme,
  --     },
  --     -- lazy状态
  --     sections = {
  --       lualine_x = {
  --        {
  --         lazy_status.updates,
  --         cond = lazy_status.has_updates,
  --         color = { fg = "#ff9e64" },
  --        },
  --        { "encoding" },
  --        { "fileformat" },
  --        { "filetype" },
  --       },
  --     },
  --   })
  -- end,
  -- 上面是old

  -- nvchad 风格配置
  config = function()
    local colors = {
      bg = "#1e222a",
      fg = "#bbc2cf",
      yellow = "#ECBE7B",
      cyan = "#008080",
      darkblue = "#081633",
      green = "#98be65",
      orange = "#FF8800",
      violet = "#a9a1e1",
      magenta = "#c678dd",
      blue = "#51afef",
      red = "#ec5f67",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    -- 简化lualine的mode块,现在取消
    -- Custom mode display function
    -- local function custom_mode()
    --   local alias = {
    --     n = "n", -- normal
    --     i = "i", -- insert
    --     c = "c", -- command
    --     v = "v", -- visual
    --     V = "V", -- visual line
    --     [""] = "B", -- visual block
    --     R = "R", -- replace
    --     t = "t", -- terminal
    --   }
    --   return alias[vim.fn.mode()] or vim.fn.mode()
    -- end
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = {
          normal = {
            a = { fg = colors.bg, bg = colors.blue },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
          },
          insert = { a = { fg = colors.bg, bg = colors.green } },
          visual = { a = { fg = colors.bg, bg = colors.magenta } },
          replace = { a = { fg = colors.bg, bg = colors.red } },
          inactive = {
            a = { fg = colors.fg, bg = colors.bg },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
          },
        },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "packer" },
      },
      sections = {
        -- lualine_a = { custom_mode },
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          { "filename", cond = conditions.buffer_not_empty, color = { fg = colors.magenta, gui = "bold" } },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            color = { fg = colors.red },
          },
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
