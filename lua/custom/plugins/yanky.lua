return {
  'gbprod/yanky.nvim',
  dependencies = {
    { 'kkharji/sqlite.lua' },
  },
  opts = {
    ring = {
      history_length = 100,
      storage = 'shada',
      sync_with_numbered_registers = true,
      cancel_event = 'update',
      ignore_registers = { '_' },
      update_register_on_cycle = false,
      permanent_wrapper = nil,
    },
    system_clipboard = {
      sync_with_ring = true,
    },
    highlight = {
      on_put = false,
      on_yank = false,
      timer = 0,
    },
  },

  keys = {
    {
      '<leader>p',
      function()
        require('telescope').extensions.yank_history.yank_history()
      end,
      mode = { 'n', 'x' },
      desc = 'Yank History',
    },
    -- { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
    -- splitted these
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
    -- into these
    -- { 'p', '"_d<Plug>(YankyPutAfter)', mode = 'x', desc = 'Replace selection with yanked text' },
    -- { 'P', '"_d<Plug>(YankyPutBefore)', mode = 'x', desc = 'Replace selection with yanked text before' },
    -- added the following two for yanky to understand normal mode pastings
    -- { 'p', '<Plug>(YankyPutAfter)', mode = 'n', desc = 'Put yanked text after cursor' },
    -- { 'P', '<Plug>(YankyPutBefore)', mode = 'n', desc = 'Put yanked text before cursor' },
    -- { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor and leave cursor after' },
    -- { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor and leave cursor after' },
    { '[y', '<Plug>(YankyPreviousEntry)', desc = 'Previous yank' },
    { ']y', '<Plug>(YankyNextEntry)', desc = 'Next yank' }, -- { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
    { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    -- { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
    -- { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
    -- { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
    -- { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
    -- { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
    -- { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
    -- { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },

    -- final iteration
    {
      '>p',
      'a <Esc><Plug>(YankyPutAfterCharwiseJoined)',
      desc = 'Paste trimmed inline after + leading space',
    },
    {
      '<p',
      '<Plug>(YankyGPutBeforeCharwiseJoined)i <Esc>h',
      desc = 'Paste trimmed inline before + trailing space',
    },
  },
}

--
-- { ']c', '<Plug>(YankyPutAfterCharwise)', desc = 'Paste inline after cursor' },
-- { '[c', '<Plug>(YankyPutBeforeCharwise)', desc = 'Paste inline before cursor' },

-- { '>p', '<Plug>(YankyPutAfterCharwise)', desc = 'Paste inline after cursor' },
-- { '<p', '<Plug>(YankyPutBeforeCharwise)', desc = 'Paste inline before cursor' },

-- iteration one
-- { '>p', '<Plug>(YankyPutAfterCharwiseJoined)', desc = 'Paste trimmed inline after cursor' },
-- { '<p', '<Plug>(YankyPutBeforeCharwiseJoined)', desc = 'Paste trimmed inline before cursor' },
--
--iteration two
-- {
--   '>p',
--   'a <Esc><Plug>(YankyPutAfterCharwiseJoined)',
--   desc = 'Paste trimmed inline after + leading space',
-- },
-- {
--   '<p',
--   '<Plug>(YankyGPutBeforeCharwiseJoined)i <Esc>',
--   desc = 'Paste trimmed inline before + trailing space',
-- },
