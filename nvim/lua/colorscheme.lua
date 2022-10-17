local present, tokyonight = pcall(require, "tokyonight")
if present then 
	tokyonight.setup({
		transparent = "true",
		style = "night"
	})
	vim.cmd("colorscheme tokyonight")
end 

local present, kanagawa = pcall(require, "kanagawa")

if present then
	kanagawa.setup({
		commentStyle = { italic = false },
		keywordStyle = { italic = false },
		variablebuiltinStyle = { italic = false },
		transparent = true,
	})

	vim.cmd("colorscheme kanagawa")
end
