local M = {};
function getScriptDirectory()
    local scriptPath = arg[0] or debug.getinfo(1, 'S').source
    local scriptDir = scriptPath:match("@?(.*[/\\])")
    if not scriptDir then
        vim.api.nvim_err_writeln("Failed to find direcoty")
    end
    return scriptDir
end

local initDir = getScriptDirectory();
--print(initDir);
local function read()
    local file = io.open(initDir .. "data.langs", "r")

    if file then
        local content = file:read("*all")
        local loadedTable = load(content)()
        file:close()
        return loadedTable
    else
        vim.api.nvim_err_writeln("Failed to open the file for reading.")
    end
end
local function addFT(filetypes)
    local currentTable = read() or {}

    for _, ft in ipairs(filetypes) do
        local exists = false
        for _, currentFT in ipairs(currentTable) do
            if currentFT == ft then
                exists = true
                break
            end
        end
        if not exists then
            table.insert(currentTable, ft)
        end
    end

    local file = io.open(initDir .. "data.langs", "w")
    if file then
        local serializedTable = {}
        for _, ft in ipairs(currentTable) do
            table.insert(serializedTable, '"' .. ft .. '"')
        end

        file:write("return {\n" .. table.concat(serializedTable, ",\n") .. "\n}")
        file:close()
    else
        vim.api.nvim_err_writeln("Failed to open the file for writing.")
    end
end
local function addCurrentFT()
    local ft = vim.bo.filetype;
    if ft ~= "markdown" and ft ~= "" then
        addFT({ ft })
        print("added filetype " .. ft)
    else
        print("filetype not supported ")
    end
end
M.setup = function()
    vim.api.nvim_create_user_command("AddFT", function() addCurrentFT() end, {})
    vim.api.nvim_create_user_command("AddLSP", function()
        vim.cmd("LspInstall");
    end, {})
end
M.filetypes = read()
--server configuration
M.servers = {
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
}

return M
