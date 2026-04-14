return {
  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", lazy = false },
  -- Increment/decrement dates, constants, semver, etc.
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")

      vim.list_extend(opts.groups.default, {
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%m/%d"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.ja_weekday_full,
        augend.semver.alias.semver,
      })
    end,
  },
}
