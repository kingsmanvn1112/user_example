-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "cssls",
        "html",
        "pyright",
        "pylsp",
        "bashls",
        "jsonls",
        "yamlls",
        "gopls",
        "arduino_language_server",
        "tsserver",
        "stylelint_lsp",
        "vimls",
        "cmake",
        "ruby_ls",
        "volar",
        "docker_compose_language_service",
        "dockerls",
        "jqls",
        "custom_elements_ls",
        "gradle_ls",
        "grammarly",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        "htmlhint",
        "cmakelang",
        "cmakelint",
        "codespell",
        "commitlint",
        "cpplint",
        "cspell",
        "eslint_d",
        "gdtoolkit",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "pylint",
        "shellcheck",
        "stylelint",
        "textlint",
        "htmlbeautifier",
        "jq",
        "autopep8",
        "beautysh",
        "cmakelang",
        "gdtoolkit",
        "golines",
        "google-java-format",
        "gotests",
        "markdownlint",
        "prettierd",
        "sql-formatter",
        "xmlformatter",
        "yamlfix",
        "yamlfmt",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
        "bash-debug-adapter",
        "cpptools",
        "debugpy",
        "go-debug-adapter",
        "java-debug-adapter",
        "java-test",
        "js-debug-adapter",
        "node-debug2-adapter",
        "perl-debug-adapter",
        "php-debug-adapter",
        "vscode-java-decompiler",
      })
    end,
  },
}
