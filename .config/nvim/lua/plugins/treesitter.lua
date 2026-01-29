return {
    'nvim-treesitter/nvim-treesitter',
    tag = "v0.10.0",
    lazy = false,
    build = ':TSUpdate', -- Automatically runs TSUpdate after installation
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "cpp", "lua", "python", "vim", "vimdoc", "query" }, -- Add languages you need
            highlight = {
                enable = true,                                                            -- Enable syntax highlighting
            },
            -- additional config options
        })

        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99 -- Open all folds by default on file open
    end
}
