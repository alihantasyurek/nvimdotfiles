-- add this to the end of the init.lua
-- require("initSettings")
vim.opt.relativenumber = true
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.opt.nu = true
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.list = false
vim.opt.listchars = {}

vim.opt.termguicolors = true
vim.keymap.set({ 'i', 'n', 's' }, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

-- shift highlight allows to move the highlighted lines with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
--for J to stay in place
vim.keymap.set('n', 'J', 'mzJ`z')
--keeps the cursor in the middle when C-d and C-u
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
--keeps the cursor in the middle when jumping between seach terms
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.g.have_nerd_font = true
--make it executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--cut the line without getting the \n
vim.keymap.set('n', '<leader>x', [[_D"_dd]], { desc = 'Cut this line without a new line' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy the word to the clipboard' })
vim.keymap.set('n', '<leader>Y', [[_"+Y]], { desc = 'Copy the line to the clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete the word to the void register' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('x', '<leader>p', [["_dP]])

--quickfix list navigation
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>zz')

vim.keymap.set('n', '<C-n>', ':bnext<CR>')
vim.keymap.set('n', '<C-p>', ':bprevious<CR>')
vim.keymap.set('n', '<C-x>', ':bdelete<CR>')
vim.keymap.set('n', '<C-s>', '<cmd>silent :w | %bd! | e#<CR>')

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- terminal exit
vim.keymap.set('t', '<C-n><C-n>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

local signs = {
  [vim.diagnostic.severity.ERROR] = '󰅚 ',
  [vim.diagnostic.severity.WARN] = '󰀪 ',
  [vim.diagnostic.severity.INFO] = '󰋽 ',
  [vim.diagnostic.severity.HINT] = '󰌶 ',
}

-- Disable ESLint LSP server and hide virtual text in Neovim
local isLspDiagnosticsVisible = true
vim.keymap.set('n', '<leader>lx', function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config {
    virtual_text = isLspDiagnosticsVisible,
    underline = isLspDiagnosticsVisible,
    signs = isLspDiagnosticsVisible and { text = signs } or false,
  }
end)

local methods = vim.lsp.protocol.Methods
local ellipsis = '...'

-- Workaround for truncating long TypeScript inlay hints.
-- local inlay_hint_handler = vim.lsp.handlers[methods.textDocument_inlayHint]
--
-- vim.lsp.handlers[methods.textDocument_inlayHint] = function(err, result, ctx, config)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--
--   if client and client.name == 'typescript-tools' and result then
--     result = vim
--       .iter(result)
--       :map(function(hint)
--         local label = hint.label
--
--         -- if type(label) == 'string' and label:len() >= 30 then
--         label = label:gsub('<.*>', '<...>')
--         -- end
--
--         hint.label = label
--         return hint
--       end)
--       :totable()
--   end
--
--   inlay_hint_handler(err, result, ctx, config)
-- end

-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	desc = "Dpngaaaisable automatic comment insertion",
-- 	group = vim.api.nvim_create_augroup("AutoComment", {}),
-- 	callback = function()
-- 		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
-- 	end,
-- })

-- Compile C++
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>m",
-- 	"<cmd>cd %:h<CR><cmd>compiler c++<CR><cmd>silent make<CR>:lua if #vim.fn.getqflist() > 0 then vim.cmd('copen') else vim.cmd('cclose') end<CR>",
-- 	{ noremap = true, silent = true, desc = "Compile C++ code" }
-- )

-- Pressing Enter (<CR>) jumps to the selected error/location in quickfix
-- vim.api.nvim_command("augroup QuickfixNavigation")
-- vim.api.nvim_command("autocmd!")
-- vim.api.nvim_command("autocmd FileType qf nnoremap <buffer> <CR> <cmd>cc<CR>")
-- vim.api.nvim_command("augroup END")
