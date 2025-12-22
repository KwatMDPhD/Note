vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.updatetime = 240

vim.keymap.set("n", "<Leader>h", "<Cmd>nohlsearch<CR>")

if vim.g.neovide then
    local sf = "neovide_scale_factor"
    vim.keymap.set("n", "<Leader>1", function() vim.g[sf] = 1 end)
    vim.keymap.set("n", "<Leader>0", function() vim.g[sf] = vim.g[sf] - 0.1 end)
    vim.keymap.set("n", "<Leader>2", function() vim.g[sf] = vim.g[sf] + 0.1 end)
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
            view = { width = 64 },
            filters = { custom = { "^\\.git$" } },
            update_focused_file = { enable = true },
        },
        keys = { { "<Leader>t", "<Cmd>NvimTreeToggle<CR>" } },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        keys = {
            { "<Leader>b", "<Cmd>Telescope buffers<CR>" },
            { "<Leader>f", "<Cmd>Telescope find_files<CR>" },
            { "<Leader>r", "<Cmd>Telescope live_grep<CR>" },
        },
    },

    {
        "folke/tokyonight.nvim",
        config = function() vim.cmd.colorscheme("tokyonight") end,
    },

    "lewis6991/gitsigns.nvim",

    {
        "brenoprata10/nvim-highlight-colors",
        opts = {},
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "bash", "lua", "html", "markdown", "markdown_inline", "julia" },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = "<Leader>s",
            size = function() return math.floor(vim.o.lines * 0.32) end,
        },
    },
})

vim.keymap.set({"n", "v"}, "<Space><Space>", "<Cmd>ToggleTermSendVisualLines<CR>")
