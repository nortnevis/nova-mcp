-- .nvim.lua

local project_root = vim.fs.root(0, { ".git", ".clangd" })
if project_root == "" then
	project_root = vim.fn.expand("<sfile>:p:h")
	if project_root == "" then
		project_root = vim.fn.getcwd()
	end
end

local clangd_path = project_root .. "/tools/bin/clangd"

vim.lsp.config("clangd", {
	cmd = {
		clangd_path,
		"--background-index",
		"--clang-tidy",
	},
	root_dir = project_root,
})

vim.lsp.enable("clangd")
