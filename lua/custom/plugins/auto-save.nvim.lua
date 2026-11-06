return {
  {
    'okuuva/auto-save.nvim',
    version = '^1.0.0',
    cmd = 'ASToggle',
    keys = {
      { '<leader>n', ':ASToggle<CR>', desc = 'Toggle auto-save' },
    },
    event = { 'VeryLazy' },
    opts = {
      enabled = true,
      trigger_events = {
        immediate_save = { 'CursorHold' },
        defer_save = {},
        cancel_deferred_save = { 'InsertEnter' },
      },
      condition = nil,
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,
      debounce_delay = 1250,
      debug = false,
    },
  },
}
