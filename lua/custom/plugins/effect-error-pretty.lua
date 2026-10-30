return {
  'rashedInt32/effect-error-pretty.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    float = true,
    effect = true,
    format_ts_errors_fallback = true,
  },
}
