AddCSLuaFile("meichlang/compiler.lua")
include("meichlang/compiler.lua")

-- Reg meich extension
hook.Add("Initialize", "LoadMeichLang", function()
    MEICHLANG = MEICHLANG or {}
    MEICHLANG.Compiler = Compiler:new()

    -- Running code
    MEICHLANG.Compiler:run("src/index.meich")
end)