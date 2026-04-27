---@diagnostic disable: undefined-global
return {
  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup {
        enabled = true,
        patterns = {
          {
            file_pattern = '.env*',
            cloak_pattern = '=.+',
          },
        },
      }

      -- keymaps
      vim.keymap.set('n', '<leader>ca', '<cmd>CloakToggle<CR>')
      vim.keymap.set('n', '<leader>cl', '<cmd>CloakPreviewLine<CR>')
    end,
  },
}
