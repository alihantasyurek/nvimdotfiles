return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  cmd = 'Obsidian',
  keys = {
    {
      '<leader>td',
      '<cmd>Obsidian today<CR>',
      desc = 'Obsidian Today',
    },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
      {
        name = 'work',
        path = '~/vaults/work',
      },
    },
    picker = {
      name = 'telescope.nvim',
    },
    ui = {
      enable = false,
    },
    checkbox = {
      enabled = true,
      create_new = true,
      order = { ' ', 'x', '>' },
      --order = { ' ', 'x', '>', '~', '!' },
    },
    callbacks = {
      enter_note = function()
        vim.cmd 'normal! G'
      end,
    },
  },
}
