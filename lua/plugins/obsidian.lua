return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Vlad's Obsidian Vault",
					path = "~\\Documents\\Vlad's Obsidian Vault",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
				new_notes_location = "00 - Inbox",
				prepend_note_id = true,
			},
			note_frontmatter_func = function(note)
				local out = { id = note.id, aliases = note.aliases, tages = note.tags }
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
					for key, value in pairs(note.metadata) do
						out[key] = value
					end
				end
				return out
			end,

			ui = {
				enabled = true,
			},

		})
	end,
}
