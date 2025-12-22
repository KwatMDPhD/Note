vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.signcolumn = "number"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.updatetime = 240

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<CR>")

if vim.g.neovide then
  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1
  end)
  vim.keymap.set("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.16
  end)
  vim.keymap.set("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.16
  end)
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      view = { width = 56 },
      filters = {
        custom = { "^\\.git$" },
      },
    },
    keys = {
      { "<Leader>t", "<Cmd>NvimTreeToggle<CR>" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "^.git/" },
        path_display = { "smart" },
      },
      pickers = {
        find_files = { hidden = true },
        live_grep = {
          additional_args = { "--hidden", "--glob", "!.git/*" },
        },
      },
    },
    keys = {
      { "<Leader>b", "<cmd>Telescope buffers<cr>" },
      { "<Leader>f", "<cmd>Telescope find_files<cr>" },
      { "<Leader>r", "<cmd>Telescope live_grep<cr>" },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  {
    "dominikduda/vim_current_word",
    config = function()
      vim.g["vim_current_word#highlight_current_word"] = 0
      vim.cmd.highlight("CurrentWordTwins guibg=#790505")
    end,
  },

  { "lewis6991/gitsigns.nvim", config = true },

  { "brenoprata10/nvim-highlight-colors", config = true },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "html",
        "markdown",
        "markdown_inline",
        "julia",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "neovim"
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_cell_delimiter = "# ---- #"
    end,
    keys = {
      { "<Space><Space>", "<Plug>SlimeSendCell", mode = "n" },
      { "<Space><Space>", "<Plug>SlimeRegionSend", mode = "x" },
    },
  },
})
