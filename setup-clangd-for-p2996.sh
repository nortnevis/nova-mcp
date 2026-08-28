#!/bin/bash

ln -s ../../tools build/vcpkg-multi-config/tools

# 1. determine preset
# 2. create compile_commands symlink
#
# 3. create-tools-symlink:
# ln -s ../../tools build/vcpkg-multi-config
#
# 4. create .nvim.lua if argument true
# -- .nvim.lua
# --
# -- Local project configuration for Clang/P2996 (C++26 reflection).
# -- The project bundles the fork's clangd + clang++ in ./tools/bin, the builtin
# -- resource headers in ./tools/lib/clang/21, and the fork's libc++ in
# -- ./tools/lib/libcxx. The compile flags (libc++ include dir, -freflection-latest,
# -- ...) live in .clangd, which clangd reads on its own.
# --
# -- NOTE: paths below are absolute for this checkout. If you move this project,
# -- update this file and .clangd accordingly.
#
# local project_root = vim.fs.root(0, { ".git", ".clangd", "compile_commands.json" })
#
# if project_root == "" then
# 	project_root = vim.fn.expand("<sfile>:p:h")
# 	if project_root == "" then
# 		project_root = vim.fn.getcwd()
# 	end
# end
#
# local clangd_path = project_root .. "/tools/bin/clangd"
#
# vim.lsp.config("clangd", {
# 	cmd = {
# 		clangd_path,
# 		"--background-index",
# 	},
# 	root_dir = vim.fs.root(0, { ".git", ".clangd", "compile_commands.json" }),
# })
#
# vim.lsp.enable("clangd")
