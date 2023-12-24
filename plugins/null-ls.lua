return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      --null_ls.builtins.formatting.astyle,
      --null_ls.builtins.formatting.uncrustify,
      null_ls.builtins.formatting.yamlfmt,
      null_ls.builtins.formatting.autopep8,
      null_ls.builtins.formatting.golines,
      null_ls.builtins.formatting.markdownlint,
      null_ls.builtins.formatting.beautysh,
      null_ls.builtins.formatting.sql_formatter,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.luacheck,
      --null_ls.builtins.diagnostics.cpplint,
      null_ls.builtins.diagnostics.markdownlint,
      --null_ls.builtins.diagnostics.actionlint,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.pylint,
      null_ls.builtins.diagnostics.tidy,
      null_ls.builtins.code_actions.eslint_d,
      null_ls.builtins.code_actions.shellcheck,
    }
    return config -- return final config table
  end,
}
