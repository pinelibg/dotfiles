return {
  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function()
      vim.g.better_whitespace_ctermcolor = "darkred"
      vim.g.better_whitespace_guicolor = "darkred"
    end,
  },
}
