-- return {
--   {
--     'folke/snacks.nvim',
--     priority = 1000,
--     lazy = false,
--     opts = {
--       dashboard = { enabled = true },
--     },
--   },

-- }
--
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header', padding = 10 },
          { section = 'keys', gap = 1, padding = 5 },
          {
            padding = 5,
            text = {
              { "'What we assembled with trembling hands, rose to question its maker'", align = 'center', hl = 'Comment' },
            },
          },
        },
      },
    },
  },
}
