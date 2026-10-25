return {
  -- 1. Add the colorscheme plugin
  { "ellisonleao/gruvbox.nvim", lazy = true, priority = 1000 },

  -- 2. Configure LazyVim to load it on startup
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
