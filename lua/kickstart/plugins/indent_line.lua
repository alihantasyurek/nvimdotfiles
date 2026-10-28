return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      local highlight = {
        'DustyLavender',
        -- 'SlateLavender',
        -- 'RainbowYellow',
        -- 'RainbowViolet',
        -- 'RainbowGreen',
        -- 'RainbowBlue',
        -- 'RainbowOrange',
        -- 'MetalicOrange',
        -- 'RainbowCyan',
        -- 'RainbowRed',
      }

      local hooks = require 'ibl.hooks'
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'DustyLavender', { fg = '#7A7690' })
        vim.api.nvim_set_hl(0, 'SlateLavender', { fg = '#5F5C70' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'MetalicOrange', { fg = '#B87333' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
      end)

      require('ibl').setup {
        indent = { highlight = highlight, char = ' ' },

        scope = {
          enabled = true,
          priority = 50,
          char = '┆',
          -- char = '╎', -- only active/current scope gets this guide
          highlight = highlight, -- scope line color
          show_start = true, -- underline start token
          show_end = false,
        },
      }
      vim.api.nvim_set_hl(0, '@ibl.scope.underline.1', {
        sp = '#9D97B6', -- dashed-line color
        underdashed = true,
      })
    end,
  },
}
