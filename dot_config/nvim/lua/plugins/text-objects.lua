return {
  { "kana/vim-textobj-user", lazy = false },
  {
    "kana/vim-textobj-entire",
    lazy = false,
    dependencies = { "kana/vim-textobj-user" },
  },
  {
    "kana/vim-textobj-line",
    lazy = false,
    dependencies = { "kana/vim-textobj-user" },
  },
}
