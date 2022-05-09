local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.completion.luasnip,
    -- null_ls.builtins.completion.spell
    null_ls.builtins.diagnostics.eslint_d,
    -- null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.stylelint,
    -- null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.eslint_d.with({
      condition = function(utils)
        return not utils.root_has_file(".prettierrc.json")
      end,
    }),
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return utils.root_has_file(".prettierrc.json")
      end,
    }),
    -- null_ls.builtins.formatting.stylelint,
}

null_ls.setup({
  sources = sources,
  diagnostics_format = "░ #{m}",
})
