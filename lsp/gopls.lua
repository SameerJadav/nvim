return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.mod", "go.sum", ".git" },
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			verboseOutput = true,
			semanticTokens = true,
			vulncheck = "Imports",
			analyses = {
				shadow = true,
				unusedvariable = true,
				useany = true,
			},
		},
	},
}
