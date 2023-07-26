-- Load nvim-cmp
local cmp = require('cmp')

-- Define a custom completion source for brackets
local bracket_source = {
  name = 'brackets',
  keyword_pattern = [[\(([^)]*)\)]],
  complete = function(_, callback)
    local items = {
      { label = '()', insertText = '(${1})', kind = cmp.lsp.CompletionItemKind.Snippet },
      { label = '{}', insertText = '{$0}', kind = cmp.lsp.CompletionItemKind.Snippet },
      { label = '[]', insertText = '[$0]', kind = cmp.lsp.CompletionItemKind.Snippet },
    }
    callback(items)
  end,
}

-- Setup nvim-cmp with the custom completion source and other sources as needed
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    bracket_source, -- Add the custom bracket completion source
    -- Add more sources as desired
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    -- Add more mappings as desired
  },
})

