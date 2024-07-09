if not vim.g.neovide then
  return {}
end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        guifont = "Terminess Nerd Font Mono:h16",
        linespace = 0,
      },
      g = {
        neovide_scale_factor = 1.0,
        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,
      },
    },
  },
}
