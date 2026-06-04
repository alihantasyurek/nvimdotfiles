return {
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			local ufo = require("ufo")

			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldnestmax = 4
			vim.o.foldenable = true

			vim.keymap.set("n", "zR", function()
				ufo.openAllFolds()
			end)

			vim.keymap.set("n", "zM", function()
				ufo.closeAllFolds()
			end)

			vim.keymap.set("n", "zK", function()
				local winid = ufo.peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end, { desc = "Peek Fold" })
			-- Custom fold text handler that adds a line count suffix
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0

				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)

					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)

						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end

				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			-- Define custom highlights
			vim.cmd([[
  highlight UfoFoldedEllipsis ctermfg=DarkCyan guifg=#569CD6
  highlight UfoCursorFoldedLine ctermbg=DarkGray guibg=#3E3E3E
]])

			-- Setup ufo with customizations
			require("ufo").setup({
				-- Custom fold text handler
				fold_virt_text_handler = handler,

				-- Enable virtual text inspection
				enable_get_fold_virt_text = true,

				-- Customize preview window
				preview = {
					win_config = {
						border = "rounded",
						winhighlight = "Normal:Folded",
						winblend = 0,
						maxheight = 25,
					},
					mappings = {
						scrollU = "<C-b>",
						scrollD = "<C-f>",
						jumpTop = "gg",
						jumpBot = "G",
					},
				},
			})
		end,
	},
}
