return {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
        "MunifTanjim/nui.nvim",
    },

    config = function()
        require("noice").setup({

            lsp = {
                progress = {
                    enabled = true,
                },

                hover = {
                    enabled = true,
                },

                signature = {
                    enabled = false,
                },
            },

            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })
    end,
}
