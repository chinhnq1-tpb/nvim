return {
	'ThePrimeagen/harpoon',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local mark = require 'harpoon.mark'
		local ui = require 'harpoon.ui'

		vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'append buffer to harpoon' })
		vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = 'open harpoon menu' })

		vim.keymap.set('n', '<leader>1', function()
			ui.nav_file(1)
		end, { desc = 'go to buffer harpoon 1' })
		vim.keymap.set('n', '<leader>2', function()
			ui.nav_file(2)
		end, { desc = 'go to buffer harpoon 2' })
		vim.keymap.set('n', '<leader>3', function()
			ui.nav_file(3)
		end, { desc = 'go to buffer harpoon 3' })
		vim.keymap.set('n', '<leader>4', function()
			ui.nav_file(4)
		end, { desc = 'go to buffer harpoon 4' })
	end,
}
