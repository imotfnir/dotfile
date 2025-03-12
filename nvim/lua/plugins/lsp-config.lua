return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        -- Lua
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    } -- 認識 Neovim 的 vim 物件
                }
            }
        }
        -- Python
        lspconfig.pyright.setup {}
        -- C/C++
        lspconfig.clangd.setup {}
    end
}
