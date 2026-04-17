return {
  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.better_whitespace_ctermcolor = "darkred"
      vim.g.better_whitespace_guicolor = "darkred"
    end,
  },
}
