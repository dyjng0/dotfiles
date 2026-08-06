return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		local handler = function(virtText, lnum, endLnum, width, truncate)
			local newVirtText = {}
			local endLine = vim.api.nvim_buf_get_lines(0, endLnum - 1, endLnum, false)[1]
			local closingBrace = endLine:match("[%]%)%}][%]%)%}%;]*%s*$") or "}"
			local trailingComment = endLine:match("%s*(//.*)")
				or endLine:match("%s*(#.*)")
				or endLine:match("%s*(-%-.*)")

			local leading = endLine:match("^(%s*)")
			local col = #leading
			local row = endLnum - 1

			-- look up the treesitter highlight group at that position
			local captures = vim.treesitter.get_captures_at_pos(0, row, col)
			local hlGroup = #captures > 0 and ("@" .. captures[#captures].capture) or "Normal"

			local suffix = " ... " .. closingBrace .. (trailingComment and (" " .. trailingComment) or "")
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
					-- str width returned from truncate() may less than 2nd argument, need padding
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, { " ... ", "Comment" })
			table.insert(newVirtText, { closingBrace, hlGroup })
			if trailingComment then
				table.insert(newVirtText, { " " .. trailingComment, "Comment" })
			end
			return newVirtText
		end

		require("ufo").setup({
			-- fold_virt_text_handler = handler,
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
