function ColorMyPencils(color)
	color = color or "github_dark_colorblind"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
