Compiler = {}
Compiler.__index = Compiler

function Compiler:new()
    local obj = setmetatable({}, Compiler)
    return obj
end

function Compiler:compile(code)
    code = code:gsub("func main%(%)", "hook.Add('Initialize', 'MeichLangMain', function()")
    code = code:gsub("console::log", "print")
    code = code:gsub("let", "local")
    code = code:gsub("for (.-) in (.-) {", "for %1 = %2 do")
    code = code:gsub("if (.-) {", "if %1 then")
    code = code:gsub("{", "")
    code = code:gsub("}", "end")
    code = code .. ")"
    return code
end

function Compiler:run(filePath)
    local file = file.Read(filePath, "LUA")
    if file then
        local compiledCode = self:compile(file)
        print("Compiled Code:\n" .. compiledCode)
        RunString(compiledCode)
    else
        error("Failed to load MeichLang file: " .. filePath)
    end
end