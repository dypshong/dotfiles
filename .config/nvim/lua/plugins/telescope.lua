return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = "Telescope", -- Lazy load on the :Telescope command
    config = function()
        require('telescope').setup({
            -- your configuration keys here
        })
    end,
}
