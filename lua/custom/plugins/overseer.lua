return {
  'stevearc/overseer.nvim',
  opts = {
    component_aliases = {
      default = {
        'on_exit_set_status',
        'on_complete_notify',
        { 'on_complete_dispose', require_view = { 'SUCCESS', 'FAILURE' } },
        { 'open_output', on_start = 'always' },
        {
          'on_output_quickfix',
          items_only = true,
          errorformat = table.concat({
            '%f:%l:%c: %m',
            '%f:%l: %m',
            '%f(%l,%c): %m',
            '%f:%l:%c - %m',
            '%*\\s❯ %f:%l:%c', -- Vitest stack trace
          }, ','),
        },
      },
    },
    output = {
      use_terminal = false,
    },
  },
}
