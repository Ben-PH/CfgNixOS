yz = require("yazi")
vim.keymap.set("n", "<A-f>", function() yz.yazi(nil, vim.fn.expand("%:p:h")) end)
