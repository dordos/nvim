return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  opts = {
    filetypes = { "*" },
    user_default_options = {
      mode = "background",
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true
    },
  },
}
