return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("dashboard").setup({
            theme = "hyper",

            config = {
                header = {
                    "",
                    "",
                    "██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗",
                    "██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝",
                    "██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  ",
                    "██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  ",
                    "╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗",
                    " ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝",
                    "",
                    "",
                },

                shortcut = {
                    {
                        icon = "󰊳 ",
                        desc = " Github",
                        group = "DashboardShortcut",
                        action = "silent !xdg-open https://github.com/Aadiwrth",
                        key = "g",
                    },
                    {
                        icon = "󰌗 ",
                        desc = " Portfolio",
                        group = "DashboardShortcut",
                        action = "silent !xdg-open https://aadityachaudhary.info.np",
                        key = "p",
                    },
                    {
                        icon = "󰚰 ",
                        desc = " Update",
                        group = "DashboardShortcut",
                        action = "Lazy update",
                        key = "u",
                    },
                },
                project = { enable = true },
                mru = { enable = false },

                footer = {
                    "",
                    "WELCOME MASTER",
                },
            },
        })

        -- COLORS
        vim.cmd([[
            hi DashboardHeader guifg=#89b4fa gui=bold
            hi DashboardCenter guifg=#cba6f7
            hi DashboardShortcut guifg=#f38ba8 gui=bold
            hi DashboardFooter guifg=#a6e3a1
        ]])
    end,
}
