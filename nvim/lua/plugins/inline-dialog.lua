return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "powerline", -- or "simple" / "powerline" etc.
      options = {
        use_icons = true,
        show_source = true,
      },
    })

    -- Disable default virtual text so it doesn't conflict
    vim.diagnostic.config({
      underline = false,
      virtual_text = false,
    })
  end,
}
