-- bacon.lua
return {
  {
    "Canop/nvim-bacon",
    config = function()
      require("bacon").setup({
        quickfix = {
          enabled = true,
          event_trigger = true,
        },
      })
    end,
  },
}
