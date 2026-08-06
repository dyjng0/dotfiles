vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

_G.get_fold_icon = function()
	local lnum = vim.v.lnum
	local foldlevel = vim.fn.foldlevel(lnum)
	if foldlevel == 0 then
		return " "
	end
	if vim.fn.foldclosed(lnum) >= 0 then
		return ""
	end -- closed fold
	if foldlevel > vim.fn.foldlevel(lnum - 1) then
		return ""
	end
	return " " -- inside open fold
end
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.statuscolumn = "%=%{v:relnum?'':v:lnum}%{v:relnum?v:relnum:' '} %s%{%v:lua.get_fold_icon()%} "
