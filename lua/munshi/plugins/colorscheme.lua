return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Warm, low-blue light color palette
      local bg = "#1a1612"          -- Very dark warm brown (was blue #011628)
      local bg_dark = "#161310"     -- Darker warm brown (was blue #011423)
      local bg_highlight = "#2d2520" -- Warm gray highlight (was blue #143652)
      local bg_search = "#8b4513"   -- Warm brown search (was blue #0A64AC)
      local bg_visual = "#4a3728"   -- Warm brown visual (was blue #275378)
      local fg = "#f0e6d2"          -- Warm white text (was cool #CBE0F0)
      local fg_dark = "#e6d7c3"     -- Slightly darker warm white (was cool #B4D0E9)
      local fg_gutter = "#a08870"   -- Warm gray gutter (was cool #627E97)
      local border = "#8b7355"      -- Warm brown border (was cool #547998)

      require("tokyonight").setup({
        style = "night",
        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
          
          -- Override syntax highlighting colors to remove blues
          colors.blue = "#d2691e"      -- Orange instead of blue
          colors.cyan = "#cd853f"      -- Peru/tan instead of cyan
          colors.blue0 = "#daa520"     -- Goldenrod instead of blue
          colors.blue1 = "#b8860b"     -- Dark goldenrod
          colors.blue2 = "#f4a460"     -- Sandy brown
          colors.blue5 = "#deb887"     -- Burlywood
          colors.blue6 = "#d2b48c"     -- Tan
          colors.blue7 = "#bc8f8f"     -- Rosy brown
          
          -- Keep other colors warm
          colors.red = "#cd5c5c"       -- Indian red (slightly muted)
          colors.orange = "#ff8c00"    -- Dark orange
          colors.yellow = "#ffd700"    -- Gold
          colors.green = "#9acd32"     -- Yellow green (less blue)
          colors.magenta = "#dda0dd"   -- Plum (warm purple)
          colors.purple = "#d8bfd8"    -- Thistle (warm purple)
        end,
        on_highlights = function(highlights, colors)
          -- Additional overrides for specific UI elements
          highlights.CursorLine = { bg = colors.bg_highlight }
          highlights.Visual = { bg = colors.bg_visual }
          highlights.Search = { bg = colors.bg_search, fg = colors.fg }
          highlights.IncSearch = { bg = "#a0522d", fg = colors.fg }  -- Sienna
          
          -- Make comments more visible for better contrast
          highlights.Comment = { fg = "#cd853f", italic = true }  -- Peru
          
          -- Error and warning colors (warm alternatives)
          highlights.DiagnosticError = { fg = "#dc143c" }  -- Crimson
          highlights.DiagnosticWarn = { fg = "#ff8c00" }   -- Dark orange
          highlights.DiagnosticInfo = { fg = "#daa520" }   -- Goldenrod
          highlights.DiagnosticHint = { fg = "#9acd32" }   -- Yellow green
        end,
      })
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}