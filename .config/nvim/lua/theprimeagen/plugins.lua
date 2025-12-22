local plugins = {
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup()
    end,
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {}
  },
  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   ft = { "markdown" },
  --   build = function() vim.fn["mkdp#util#install"]() end,
  -- },
  {
    'arminveres/md-pdf.nvim',
    branch = 'main', -- you can assume that main is somewhat stable until releases will be made
    lazy = true,
    keys = {
        {
            "<leader>,",
            function() require("md-pdf").convert_md_to_pdf() end,
            desc = "Markdown preview",
        },
    },
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 999,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  'lervag/vimtex',
  { "folke/neodev.nvim", opts = {} },
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', "IllustratedMan-code/telescope-conda.nvim"}
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({})
      vim.cmd.colorscheme("nord")
    end,
  },
  { 'echasnovski/mini.nvim', version = '*' },
  install = {
    colorscheme = { "nord" },
  },
  -- {
  --   "rose-pine/neovim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "rose-pine",
  --   config = function()
  --     vim.cmd("colorscheme rose-pine")
  --   end
  -- },
  "folke/trouble.nvim",
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  "theprimeagen/harpoon",
  "theprimeagen/refactoring.nvim",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "nvim-treesitter/nvim-treesitter-context",
  {
    "VonHeikemen/lsp-zero.nvim",
    version = "v2.x",
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    }
  },
  "folke/zen-mode.nvim",
  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  -- "laytan/cloak.nvim",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
  "mfussenegger/nvim-jdtls",
  "terrortylor/nvim-comment",
  -- "luk400/vim-jukit",
  "christoomey/vim-tmux-navigator",
  {
    'akinsho/flutter-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',   -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    lazy = true,
  }
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }
}

return plugins
