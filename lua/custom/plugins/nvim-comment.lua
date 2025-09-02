return {
	'terrortylor/nvim-comment',
	event = 'VeryLazy',
	config = function()
		require('nvim_comment').setup { create_mappings = false }
	end,
}
