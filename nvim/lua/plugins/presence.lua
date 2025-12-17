return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "Editing with Neovim btw",
      main_image = "neovim",
      debounce_timeout = 10,
      log_level = nil, -- Enable logging
      workspace_text = "Working on %s",
    })
  end,
}
