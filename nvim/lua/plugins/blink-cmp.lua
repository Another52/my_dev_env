return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
        keymap = { preset = 'default' },
        appearance = {
            nerd_font_variant = 'mono'
        },
        -- (Default) Only show the documentation popup when manually triggered
        completion = { documentation = { auto_show = false } },
        signature = { enabled = true  }
    },
    opts_extend = { "sources.default" }
}
