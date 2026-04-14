return {
  -- Prevent Mason from auto-installing ruff globally.
  -- ruff is managed per-project via venv.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = { mason = false },
      },
    },
  },
}
