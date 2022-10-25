local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP= fn.system 	{
		"git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path 
  }
  print "Installing packer close and reopen Neovim..."
	vim.cmd[[packadd packer.nvim]]

end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then 
	return
end


-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
	  return require("packer.util").float { border = "rounded" }
		end,
	},
}

-- Install your plugins
return require("packer").startup({
function(use)
    use "wbthomason/packer.nvim"
		use "nvim-lua/popup.nvim"
		use "nvim-lua/plenary.nvim"
    -- color scheme
    use "folke/tokyonight.nvim"
    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    -- automatic bracket pairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    } 
    -- autoclose and rename html tags
    use {
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({})
        end,
    } 
    -- indent guides
    use "lukas-reineke/indent-blankline.nvim" 

    -- smooth scrolling
    use "karb94/neoscroll.nvim" 
    -- git decorations in files
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    } 
    -- surround selections
    use "kylechui/nvim-surround" 
    -- commenting
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
    } 
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim" } },
    } 
    -- telescope code actions ui
    use "nvim-telescope/telescope-ui-select.nvim" 
    -- telescope file browser
    use "nvim-telescope/telescope-file-browser.nvim" 

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    } 


    -- lsp installer
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    -- lsp
    use "neovim/nvim-lspconfig" 
		use "mfussenegger/nvim-dap"
    -- lsp ui
    use "glepnir/lspsaga.nvim" 

    -- formatting, code actions and diagnostics
		--use "mhartington/formatter.nvim"
		--use "mfussenegger/nvim-lint" 

    -- diagnostics list
    use "folke/trouble.nvim" 

    -- autocompletion
    use "hrsh7th/nvim-cmp" 
    use "hrsh7th/cmp-buffer" 
    use "hrsh7th/cmp-path" 
    use "hrsh7th/cmp-cmdline" 
    use "hrsh7th/cmp-nvim-lsp" 
    use "hrsh7th/cmp-nvim-lua" 
    use "saadparwaiz1/cmp_luasnip" 

    -- snippets
    use "L3MON4D3/LuaSnip" 
    use "rafamadriz/friendly-snippets" 

		if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end,
config = {
    display = {
        open_fn = require("packer.util").float,
    },
},
})

