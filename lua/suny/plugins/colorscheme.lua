return {
  "folke/tokyonight.nvim",
  priority = 1000,
  -- config = function()
  --   local bg = "#011628"
  --   local bg_dark = "#011423"
  --   local bg_highlight = "#143652"
  --   local bg_search = "#0A64AC"
  --   local bg_visual = "#275378"
  --   local fg = "#CBE0F0"
  --   local fg_dark = "#B4D0E9"
  --   local fg_gutter = "#627E97"
  --   local border = "#547998"
  --
  --   require("tokyonight").setup({
  --     style = "night",
  --     on_colors = function(colors)
  --       colors.bg = bg
  --       colors.bg_dark = bg_dark
  --       colors.bg_float = bg_dark
  --       colors.bg_highlight = bg_highlight
  --       colors.bg_popup = bg_dark
  --       colors.bg_search = bg_dark
  --       colors.bg_sidebar = bg_dark
  --       colors.bg_statusline = bg_dark
  --       colors.bg_visual = bg_dark
  --       colors.border = border
  --       colors.fg = fg
  --       colors.fg_dark = fg_dark
  --       colors.fg_float = fg
  --       colors.fg_gutter = fg_gutter
  --       colors.fg_sidebar = fg_dark
  --     end
  --   })
  --
  --   vim.cmd("colorscheme tokyonight")
  -- end
  config = function()
    require("tokyonight").setup({
      style = "night", -- 可以选择'storm', 'night' 或 'day'
      transparent = false, -- 透明背景
      terminal_colors = true, -- 终端颜色
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark", -- darker background for sidebars
        floats = "dark", -- darker background for floating windows
      },
      -- 配置 NVChad 风格的亮度
      on_colors = function(colors)
        colors.border = "#565f89"
      end,
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
