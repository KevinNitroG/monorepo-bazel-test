---@module 'codesettings'
vim.lsp.config("gopls", {
	---@type lsp.gopls
	settings = {
		gopls = {
			env = {
				GOPACKAGESDRIVER = "./tools/gopackagedriver.sh",
			},
		},
	},
})
