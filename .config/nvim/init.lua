-- options
vim.o.nu = true
vim.o.ts = 4
vim.o.sw = 4
vim.o.softtabstop = 4
vim.o.wildmode = 'list:longest'
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.g.mapleader = '`'
vim.o.formatexpr = 'v:lua.vim.lsp.buf.format()'
--

-- terminal mode
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "*" },
    command = "set nonu",
})

require("config.lazy")


vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover)
vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition)
vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references)


vim.cmd [[colorscheme tokyonight-moon]]

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                checkThirdParty = false, -- Optional: disable checking of third-party plugins
                library = {
                    "$VIMRUNTIME",
                    "./lua", -- Assumes your config is in ~/.config/nvim/
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

--https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
vim.lsp.config("pylsp", {
    -- Add your lspconfig settings here
    settings = {
        pylsp = {
            plugins = {
                -- Example: configure pylsp to ignore a specific linting rule (W391)
                -- pycodestyle = { enabled=false },
                -- Disable built-in formatting from pylsp if using an external formatter like black via conform
                --autopep8 = { enabled = true },
                pycodestyle = { enabled = false },
                flake8 = { enabled = true, maxLineLength = 80 },
                yapf = { enabled = true },
            },
        },
    },
})
