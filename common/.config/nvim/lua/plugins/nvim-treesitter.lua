local config = function()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "python", "javascript", "html" },
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },  
	  })
end

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
}
