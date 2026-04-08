return {
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- load at startup, it's our colorscheme
    priority = 1000, -- load before other plugins
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("ibl").setup({
        indent = { char = "▏" },
        scope = { enabled = true, char = "▎" },
      })
    end,
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Buffer tabs
  {
    "romgrk/barbar.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("barbar").setup()
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("bufferline").setup()
  --   end,
  -- },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
}
