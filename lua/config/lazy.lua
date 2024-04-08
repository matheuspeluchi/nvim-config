local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '

local plugins = {

    {
        "catppuccin/nvim", name = "catppuccin",
        config = function()
            require("catppuccin").setup()
        end
    },

  -- File Explorer
    {
      'simonmclean/triptych.nvim',
      dependencies = {
          'nvim-lua/plenary.nvim',       -- required
          'nvim-tree/nvim-web-devicons', -- optional
      }
    },

  -- Navigation
    { 'christoomey/vim-tmux-navigator' },

    -- Syntax highlight
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

  -- File search and dialog management
  -- brew install fd
   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.6',
      dependencies = {
          'nvim-lua/plenary.nvim',
          'BurntSushi/ripgrep', -- live grep
          { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      }
  },

  -- Easy Motion
   'smoka7/hop.nvim',

  -- List of all edition changes
   { 'mbbill/undotree' },

  --Startup page
   { 'goolord/alpha-nvim' },

  -- Show keymaps
   { 'folke/which-key.nvim' },

  -- Icons
   { 'nvim-tree/nvim-web-devicons' },

  -- Git diff signs
   { 'lewis6991/gitsigns.nvim' },

  -- Status Line
   { 'freddiehaddad/feline.nvim' },

  -- Git integration
    {
      "NeogitOrg/neogit",
      dependencies = {
          "sindrets/diffview.nvim",        -- optional - Diff integration
          "nvim-telescope/telescope.nvim", -- optional
      }
    },

  -- Auto Pairs
   'windwp/nvim-autopairs',

  -- Cheatsheet
   {
      'sudormrfbin/cheatsheet.nvim',
      dependencies = {
          { 'nvim-telescope/telescope.nvim' },
          { 'nvim-lua/popup.nvim' },
          { 'nvim-lua/plenary.nvim' },
      }
  },

  {
      "kylechui/nvim-surround",
      version = "*", --  for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({})
      end
  },

  { 'nvim-tree/nvim-tree.lua' },

  { "karb94/neoscroll.nvim",
     config = function ()
         require('neoscroll').setup {}
     end
  },

  --
  --== LSP ==--
  --
  { 'neovim/nvim-lspconfig' },

  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Weirdo
  { 'mfussenegger/nvim-jdtls' },

  -- Autocompletion plugin
   'hrsh7th/nvim-cmp',

  -- LSP source for nvim-cmp
   'hrsh7th/cmp-nvim-lsp',

  -- Snippets source for nvim-cmp
   'saadparwaiz1/cmp_luasnip',

  -- Snippets plugin
   { "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
       build = "make install_jsregexp"
   },

   {"aznhe21/actions-preview.nvim"},

}
require("lazy").setup(plugins, {})
