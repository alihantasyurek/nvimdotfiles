return {
  -- Added: make Emmet attach to Handlebars too
  filetypes = {
    'html',
    'css',
    'scss',
    'javascriptreact',
    'typescriptreact',
    'handlebars',
  },

  init_options = {
    -- Added: tell Emmet to treat Handlebars as HTML
    includeLanguages = {
      handlebars = 'html',
    },
  },

  root_markers = {
    'package.json',
    '.git',
  },
}
