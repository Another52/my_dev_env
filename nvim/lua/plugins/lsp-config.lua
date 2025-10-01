return{
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"emmylua_ls", "clangd", "neocmake", "jsonls"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            --lua
            vim.lsp.config("emmylua_ls", { capabilities = capabilities })
            vim.lsp.enable("emmylua_ls")
            --C++
            vim.lsp.config("clangd", { capabilities = capabilities })
            vim.lsp.enable("clangd")
            --cmake
            vim.lsp.config("neocmake", { capabilities = capabilities })
            vim.lsp.enable("neocmake")
            --json
            vim.lsp.config("jsonls", {
                capabilities = capabilities,
                settings = {
                    json = {
                        schemas = {
                            {
                                fileMatch = { "CMakePresets.json", "cmakePresets.json" },
                                url = "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json"
                            }
                        },
                        validate = { enable = true },
                    }
                }
            })
            vim.lsp.enable("jsonls")
 
            --stuff
            vim.diagnostic.config({
                virtual_text = { spacing = 4, prefix = "●" },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })


            --keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
