vim.lsp.config("*", {
	root_markers = { ".git" },
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			vim.cmd([[set completeopt+=menuone,noinsert,popup]])
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

local lsp_servers = function()
	local servers = {}
	local lsp_dir = vim.fn.stdpath("config") .. "/lsp"

	if vim.fn.isdirectory(lsp_dir) == 0 then
		vim.notify("LSP directory not found: " .. lsp_dir, vim.log.levels.ERROR)
		return servers
	end

	local scandir = vim.loop.fs_scandir(lsp_dir)
	if not scandir then
		vim.notify("Failed to scan directory: " .. lsp_dir, vim.log.levels.ERROR)
		return servers
	end

	while true do
		local name, type = vim.loop.fs_scandir_next(scandir)
		if not name then
			break
		end
		if type == "file" and name:sub(-4) == ".lua" then
			local server_name = name:sub(1, -5)
			table.insert(servers, server_name)
		end
	end

	return servers
end

vim.lsp.enable(lsp_servers())
