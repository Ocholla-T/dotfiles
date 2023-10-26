local wk = require("which-key")

wk.register({
    -- buffer
    ["<leader>b"] = { name = "+buffer" },
    ["<leader>bb"] = { "<cmd>%bd|e#|bd#<CR>", "close all except current buffer" },
    ["<leader>bx"] = { ":bd<CR>", "close current buffer" },

    -- open lazy.nvim
    ["<leader>l"] = { "<cmd>:Lazy<CR>", "lazy" },

    -- split windows
    ["<leader>s"] = { name = "+split" },
    ["<leader>sv"] = { "<C-w>v", "vertically" }, 
    ["<leader>sh"] = { "<C-w>s", "horizontally" },

    -- quit neovim
    ["<leader>q"] = { "<cmd>q<CR>", "quit neovim" },


    -- save buffer
    ["<leader>w"] = { "<cmd>w<CR>", "save current buffer" },

    
    -- move lines up and down
    ["<M-k>"] = { "<cmd>m .-2<CR>==", "move line up" },
    ["<M-j>"] = { "<cmd>m .+1<CR>==", "move line down" },

})

wk.register({
    ["<M-j>"] = { "<Esc><cmd>m .+1<CR>==gi", "move line down" },
    ["<M-k>"] = { "<Esc><cmd>m .-2<CR>==gi", "move line up" },
}, { 
    mode = "i" -- INSERT mode
})

wk.register({
    ["<M-j>"] = { "<Esc><cmd>m '>+1<CR>gv=gv", "move line down" },
    ["<M-k>"] = { "<Esc><cmd>m '<-2<CR>gv=gv", "move line up" },
}, { 
    mode = "v" -- VISUAL mode
})
