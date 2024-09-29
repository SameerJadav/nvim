# Neovim Configuration

My minimal neovim configuration.

LSP config for inlay hint and highlighting word under cursor

```lua
local client = vim.lsp.get_client_by_id(event.data.client_id)
if client then
	if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
		map("<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
		end)
	end

	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end
end
```
