local M = {}

--- try requiring a submodule and do not crash all the configs
function M.try_require(name)
    local ok, _ = pcall(require, name)
    if not ok then
        local msg = string.format(
            'The configuration is not fully loaded. Requiring `%s` failed. Check the path and syntax.',
            name
        )
        vim.api.nvim_echo(
            { { 'init.lua', 'ErrMsg'}, { ' ' .. msg } },
            true,
            {}
        )
    end
end

function M.set_keymap(mode, key, action)
    local opts = { noremap = true, silent = true}
    vim.api.nvim_set_keymap(mode, key, action, opts)
end


return M

