return {
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup {
        symbol_in_winbar = {
          enable = false,
        },
      }
      vim.api.nvim_set_hl(0, 'SagaNormal', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SagaBorder', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'SagaTitle', { bg = 'NONE' })
      vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Doc' })
    end,
  },
}
