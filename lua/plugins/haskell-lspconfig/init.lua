local lspconfig = require('lspconfig')

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
      vim.api.nvim_buf_set_keymap(buffer, 'n', '<leader>t', '<cmd>!lua %<CR>', { noremap = true, silent = true })
    end
    ,
  }
end

return M
