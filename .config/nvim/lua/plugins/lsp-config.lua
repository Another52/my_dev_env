return {
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
                ensure_installed = { "emmylua_ls", "neocmake", "qmlls", "jsonls", "mesonlsp", "html", "cssls", "biome", "tinymist" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },
        opts = {
            servers = {
                clangd = {
                    mason = false,
                }
            }
        },
        config = function(_, opts)
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            --tinymist
            vim.lsp.config("tinymist", {
                capabilities = capabilities,

                settings = {

                    exportPdf = "onType",
                    semanticTokens = "disable",

                    formatterMode = "typstyle",
                    formatterProseWrap = true, -- wrap lines in content mode
                    formatterPrintWidth = 80, -- limit line length to 80 if possible
                    formatterIndentSize = 4, -- indentation width

                }
            })
            vim.lsp.enable("tinymist")
            --biome
            vim.lsp.config("biome", { capabilities = capabilities })
            vim.lsp.enable("biome")
            --html
            vim.lsp.config("html", { capabilities = capabilities })
            vim.lsp.enable("html")
            --cssls
            vim.lsp.config("cssls", { capabilities = capabilities })
            vim.lsp.enable("cssls")
            --mesonlsp
            vim.lsp.config("mesonlsp", { capabilities = capabilities })
            vim.lsp.enable("mesonlsp")
            --qmlls
            vim.lsp.config("qmlls", { capabilities = capabilities })
            vim.lsp.enable("qmlls")
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
                                url =
                                "https://raw.githubusercontent.com/Kitware/CMake/master/Help/manual/presets/schema.json"
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
