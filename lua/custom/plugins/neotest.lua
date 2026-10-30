return {
  'nvim-neotest/neotest',
  version = '5.19.0',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
  },

  opts = function()
    return {
      adapters = {
        require 'neotest-vitest' {},
        require 'neotest-jest' {},
      },

      diagnostic = {
        enabled = true,
      },

      status = {
        enabled = true,
        virtual_text = true,
      },

      output = {
        open_on_run = true,
      },
    }
  end,

  keys = {
    {
      '<leader>tr',
      function()
        require('neotest').run.run()
      end,
      desc = 'Run nearest test',
    },
    {
      '<leader>ta',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = 'Run all tests on file',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = 'Run last test',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = 'Toggle test summary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true }
      end,
      desc = 'Show test output',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = 'Toggle output panel',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = 'Toggle test watch',
    },
    {
      '<leader>tq',
      function()
        require('neotest').run.stop()
      end,
      desc = 'Stop tests',
    },
  },
}
