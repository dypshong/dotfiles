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

-- mappings
vim.keymap.set('c', '<C-A>', '<Home>')
vim.keymap.set('c', '<C-D>', '<Del>')
vim.keymap.set('c', '<C-K>', '<End>')
vim.keymap.set('c', '<C-F>', '<Right>')
vim.keymap.set('c', '<C-B>', '<Left>')
vim.keymap.set('c', '<ESC>b', '<S-Left>')
vim.keymap.set('c', '<ESC>f', '<S-Right>')
vim.keymap.set('c', '<C-K>', function()
    vim.fn.setcmdline(
    string.sub(vim.fn.getcmdline(), 1, vim.fn.getcmdpos()-1)
    )
end)

-- omnifunc
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*" },
    command = "inoremap <Tab> <C-x><C-o>",
})

-- terminal mode
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "*" },
    command = "set nonu",
})

-- packer
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
    -- nv-lsp
    use {
        "dypshong/nv-lsp",
    }

    -- nvim-neo-tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
end)


vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover)
-- vim.keymap.set({'n', 'v'}, '<Leader>f', vim.lsp.buf.format)

-- diagnostics
vim.diagnostic.toggle = function()
    if (vim.diagnostic.is_disabled()) then
        vim.diagnostic.enable() 
    else
        vim.diagnostic.disable() 
    end
end
