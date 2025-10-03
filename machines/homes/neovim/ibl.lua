local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { 
		highlight = {"Whitespace"},
		char =  "▏" 
	},
    whitespace = {
        -- highlight = highlight,
        -- remove_blankline_trail = false,
    },

    scope = { 
	enabled = true,
	-- highlight = highlight,
	char = "▎"
    }
}
