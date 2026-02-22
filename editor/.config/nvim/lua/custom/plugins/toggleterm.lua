return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      direction = 'float',
      float_opts = {
        border = 'curved', -- single | double | shadow | curved
      },
    },
    keys = {
      { '<leader>t', '<cmd>ToggleTerm<CR>', desc = 'Toggle terminal' },
    },
  },
}
