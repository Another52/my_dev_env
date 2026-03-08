return {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },

    opts = {
        preview = {
            filetypes = { "markdown", "html", "latex", "markdown-inline",
                "yaml" }
        }
    }
};
