return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },

    opts = {
        preview = {
            enable = false
        }
    },

    keys = {
        {
            "<leader>m",
            "<cmd>Markview<CR>",
            desc = "Toggles 'markview' previews globally"
        }
    }
};
