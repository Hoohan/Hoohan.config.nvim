
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
if packer_bootstrap then
  vim.notify("packer booting")
end

local packer = require("packer")
packer.startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- colorscheme: tokyonight
    use("folke/tokyonight.nvim")
    --------------------- plugins -------------------------
    -- nvim-tree
    use({
      "nvim-tree/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",
    })
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
        "moll/vim-bbye",
      },
    })
    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
      },
    })
    use("arkav/lualine-lsp-progress")
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })
    -- dashboard-nvim
    use("glepnir/dashboard-nvim")
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
      end,
    })
    -- ui
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    -- auto-pair
    use("windwp/nvim-autopairs")
    -- comments
    use("numToStr/Comment.nvim")
    -- doxygen
    use({
      "danymat/neogen",
      requires = "nvim-treesitter/nvim-treesitter",
      -- Uncomment next line if you want to follow only stable versions
      tag = "*",
    })
    -- notify
    use({
      "folke/noice.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      },
    })
    --------------------- LSP --------------------
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet
    use("hrsh7th/vim-vsnip")
    -- cmp sources
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    -- snippets
    use("rafamadriz/friendly-snippets")
    -- null-ls
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = "nvim-lua/plenary.nvim",
    })
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
