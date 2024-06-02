-- ys + motion 在左右加上你下一个键入的键
-- ys + iw + "" 在一个word左右加上""
-- ds 和 ys相反,去掉键入的键
-- cs + 原"" + 新'' 将word左右的"" 换成 ''
return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
