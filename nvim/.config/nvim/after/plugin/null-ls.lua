local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.completion.luasnip,
    -- null_ls.builtins.completion.spell
    null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.stylelint,
    -- null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.stylelint,
}

null_ls.setup({
  sources = sources,
})
