local lspconfig = require('lspconfig')

--function CaptureAndNotify()
  --local output = vim.fn.system('runhaskell main.hs')
  --vim.notify(output, vim.log.levels.INFO)
--end

local M = {}
function M.setup()
  lspconfig.hls.setup {
    on_attach = function(_, buffer)
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true })
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', ':! runhaskell %<CR>', { noremap = true, silent = true })
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', ':! runhaskell --ghc-arg=-v0 %<CR>',
        --{ noremap = true, silent = true })
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', '<cmd>lua CaptureAndNotify()<CR>',
        --{ noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', ':! runhaskell % | cat<CR>',
        { noremap = true, silent = true })
      --vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', ':!runhaskell % > /tmp/haskell_output.txt && cat /tmp/haskell_output.txt<CR>', { noremap = true, silent = true })
    end
    ,
        -- Haskell-specific settings
    settings = {
      haskell = {
        cabalFormattingProvider = "cabalfmt", -- Formatter for .cabal files
        formattingProvider = "stylish-haskell", -- You can switch to "fourmolu" here if you prefer
      }
    },
  }
end

return M
