return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,

				null_ls.builtins.formatting.black,
				require("none-ls.diagnostics.flake8").with({
					extra_args = {
						"--max-line-length=88",
						"--ignore=R,duplicate-code,W0231,W0511,W1201,W1202,W0707,C0301,no-init",
					},
				}),
			},
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
