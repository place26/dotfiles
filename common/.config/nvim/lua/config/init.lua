local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('config.globals')
require('config.options')
require('config.keymaps')
-- require('util.keymapper')

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "nightfox" },
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrw",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = false,
	},
}

-- obsidian 관련 설정, conceallevel과 관련된 에러 방지
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "WinEnter"}, {
    pattern = "*.md",  -- Markdown 파일에 대해서만 적용
    callback = function()
        if vim.fn.exists(':Obsidian') ~= 0 then  -- obsidian.nvim이 로드된 경우
            vim.wo.conceallevel = 2
        end
    end,
})

require("lazy").setup('plugins')
