vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

    -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'onsails/lspkind-nvim' }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }

  -- Autocomplete
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'ray-x/cmp-treesitter' }
  use { 'lukas-reineke/cmp-rg' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs', config = lua_path"nvim-autopairs" }
  use { 'AndrewRadev/tagalong.vim' }
  use { 'andymass/vim-matchup' }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
  use { 'p00f/nvim-ts-rainbow', config = lua_path"nvim-ts-rainbow" }
  use { 'lukas-reineke/indent-blankline.nvim', config = lua_path"indent-blankline" }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'lewis6991/nvim-treesitter-context' }
  use { 'SmiteshP/nvim-gps', config = lua_path"nvim-gps" }

  -- Syntax
  use { 'moll/vim-node' }
  use { 'editorconfig/editorconfig-vim', config = lua_path"editorconfig" }
  use { 'chrisbra/csv.vim' }
  use { 'junegunn/vim-easy-align' }
  use { 'mhartington/formatter.nvim', config = lua_path"formatter" }
  use { 'zdharma-continuum/zinit-vim-syntax' }
  use { 'rust-lang/rust.vim' }
  use { 'numToStr/Comment.nvim', config = lua_path"comment"}

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'ryanoasis/vim-devicons' }

  -- Status Line and Bufferline
  use { 'famiu/feline.nvim', config = lua_path"feline" }
  use { 'romgrk/barbar.nvim' }

  -- Telescope
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }
  use { 'nvim-telescope/telescope-fzy-native.nvim' }
  use { 'cljoly/telescope-repo.nvim' }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'pwntester/octo.nvim', config = lua_path"octo" }

  -- Explorer
  use { 'kyazdani42/nvim-tree.lua', config = lua_path"nvimtree", tag = 'nightly' }

  -- Color
  use { 'crivotz/nvim-colorizer.lua', config = lua_path"colorizer" }
  use { 'lpinilla/vim-codepainter' }

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = lua_path"gitsigns" }
  use { 'kdheepak/lazygit.nvim' }
  use { 'rhysd/committia.vim' }

  -- Registers & clipboard
  use { 'tversteeg/registers.nvim' }
  use { 'AckslD/nvim-neoclip.lua', config = lua_path"nvim-neoclip" }

  -- Move & Search & replace
  use { 'nacro90/numb.nvim', config = lua_path"numb" }
  use { 'dyng/ctrlsf.vim', config = lua_path"ctrlsf" }
  use { 'kevinhwang91/nvim-hlslens', config = lua_path"hlslens" }
  use { 'ggandor/lightspeed.nvim', config = lua_path"lightspeed" }
  use { 'ThePrimeagen/harpoon', config = lua_path"harpoon" }
  use { 'karb94/neoscroll.nvim', config = lua_path"neoscroll" }
  use { 'dstein64/nvim-scrollview' }
  use { 'chaoren/vim-wordmotion' }
  use { 'fedepujol/move.nvim' }

  -- Tim Pope docet
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-capslock' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-dadbod' }
  use { 'tpope/vim-jdaddy' }

  -- Tmux
  use { 'christoomey/vim-tmux-navigator' }

  -- Tags
  use { 'ludovicchabant/vim-gutentags', config = lua_path"vim-gutentags" }

  -- Debugger
  -- use { 'mfussenegger/nvim-dap', config = lua_path"nvim-dap" }
  -- use { 'rcarriga/nvim-dap-ui', config = lua_path"nvim-dap-ui" }
  -- use { 'theHamsta/nvim-dap-virtual-text', config = lua_path"nvim-dap-virtual-text" }

  -- General Plugins
  use { 'rcarriga/nvim-notify', config = lua_path"nvim-notify" }
  use { 'airblade/vim-rooter', config = lua_path"vim-rooter" }
  use { 'mhinz/vim-startify' }
  use { 'goolord/alpha-nvim', config = lua_path"alpha-nvim" }
  use { 'jeffkreeftmeijer/vim-numbertoggle' }
  use { 'lambdalisue/suda.vim' }
  use { 'numtostr/FTerm.nvim', config = lua_path"fterm" }
  use { 'wfxr/minimap.vim', config = lua_path"minimap" }
  use { 'folke/todo-comments.nvim', config = lua_path"todo-comments" }
  use { 'luukvbaal/stabilize.nvim', config = lua_path"stabilize" }
  use { 'beauwilliams/focus.nvim', config = lua_path"focus" }
  use { 'folke/trouble.nvim' }
  use { 'kevinhwang91/nvim-bqf' }

  -- Colorscheme
  use { 'sainnhe/gruvbox-material' }
  use { 'Mofiqul/dracula.nvim' }
  use { 'tanvirtin/monokai.nvim' }
  use { 'navarasu/onedark.nvim' }

  -- Other
  use { 'andweeb/presence.nvim', config = lua_path"presence" } -- Discord presence
  use { 'wakatime/vim-wakatime' } -- WakaTime
end)
