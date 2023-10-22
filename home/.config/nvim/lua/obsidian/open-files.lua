return function()
    -- currently compatible with url and pdf
    vim.cmd('noau normal! "vy"')
    local selected_text = vim.fn.getreg('v')

    if string.match(selected_text, '^https?://') then
        vim.fn.system('brave ' .. selected_text)
    elseif string.match(selected_text, '%.pdf$') then
        vim.fn.system('zathura ' .. vim.g.vaultdir .. '/attachments/' .. selected_text)
    end
end
