local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
     use 'nvim-tree/nvim-tree.lua'
     use 'nvim-tree/nvim-web-devicons'
     use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
     }
     use 'nvim-treesitter/nvim-treesitter'
     
    -- comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- autocomplete
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    -- catpuccin theme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- onedark colorscheme
    use("navarasu/onedark.nvim")
    
    -- gruvbox theme
    use { "ellisonleao/gruvbox.nvim" }

    -- coloriser
    use 'NvChad/nvim-colorizer.lua'
 
    -- Everforest
    use 'sainnhe/everforest'

    -- Rose-pine
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Tokyonight
   use  {
            "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        }
    -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
