return {
  'razak17/tailwind-fold.nvim',
  opts = {},
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  ft = { 'html', 'svelte', 'astro', 'vue', 'javascriptreact', 'typescriptreact', 'php', 'blade' },
  keys = {
    {
      '<leader>tf',
      function()
        require('tailwind-fold.conceal').toggle()
      end,
      desc = 'Toggle Tailwind class folding',
    },
  },
}
