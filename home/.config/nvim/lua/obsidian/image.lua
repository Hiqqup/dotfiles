local fn = "fn=$(date +'%d-%m-%Y-%H:%M:%S')"
local echo = [[ echo "$fn" ]]
return {
    paste = function()
        --local filename = vim.fn.system("~/.config/my-scripts/clip-to-file.sh " .. vim.g.vaultdir .. "/attachments")
        local filename = vim.fn.system(
            fn .. ".png && cp /tmp/e.png " .. vim.g.vaultdir .. '/attachments/$fn &&' .. echo
        )
        filename = filename:gsub("^%s*(.-)%s*$", "%1")
        vim.api.nvim_put({ "![](../attachments/" .. filename .. ")" }, "", false, true)
    end,
    draw =
        function()
            local filename = vim.fn.system(fn .. "&&" .. echo)
            vim.fn.system(
                "cd " ..
                vim.g.vaultdir .. "/attachments && ~/.config/my-scripts/draw/lets-draw.sh " ..
                filename .. " > /dev/null 2>&1 &")

            filename = filename:gsub("^%s*(.-)%s*$", "%1")
            vim.api.nvim_put({ "![](../attachments/" .. filename .. ".png)" }, "", false, true)
        end,
}
