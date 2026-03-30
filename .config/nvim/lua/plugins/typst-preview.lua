return {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '1.*',
    opts = {},    -- lazy.nvim will implicitly calls `setup {}`
    keys = {
        {
            "<leader>tp",
            "<cmd>TypstPreview<CR>",
            desc = "Toggles 'TypstPreview' previews"
        }
    }
}
