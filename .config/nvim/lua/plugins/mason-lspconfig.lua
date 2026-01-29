return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {},
    },
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "pylsp" },
        })

        vim.lsp.config("pylsp", {
            settings = {
                pylsp = {
                    plugins = {
                        autopep8 = { enabled = false },
                        black = { enabled = false },
                        yapf = { enabled = false },
                        flake8 = { enabled = true },
                    },
                },
            },
        })
    end,
}
