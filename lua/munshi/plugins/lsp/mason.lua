return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")
    
    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      -- Add these settings for better reliability
      pip = {
        upgrade_pip = true,
      },
      github = {
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",        -- Updated from "tsserver" (deprecated)
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
      },
      -- Add automatic installation
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "stylua",     -- lua formatter
        "isort",      -- python formatter
        "black",      -- python formatter
        "prettier",   -- uncomment this - it's useful
        "eslint_d",   -- javascript linter
      },
      -- Add automatic installation and update
      auto_update = false,
      run_on_start = true,
    })
  end,
}