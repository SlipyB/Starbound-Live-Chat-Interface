
local t = {
    {"maybe", "perhaps"},
    {"Maybe", "Perhaps"},
    {"group", "clan"},
    {"Group", "Clan"},
    {"gathering", "clan"},
    {"Gathering", "Clan"},
    {"way", "Ways of Chaos"},
    {"Way", "Ways of Chaos"},
    {"good", "Chaos"},
    {"Good", "Chaos"},
    {"lucifearus", "god"},
    {"Lucifearus", "God"},
    {"lua", "lua Gold"},
    {"Lua", "Lua Gold"},
    {"LUA", "Hacks"},
    {"dll", "dll magic"},
    {"magicks", "dll user"},
    {"y;vl", "dll user"},
    {"yvl", "dll user"},
    {"sev", "dll user"},
    {"remi", "dll user"},
    {"Remi", "dll user"},
    {"the pro", "dll user"},
    {"The Pro", "dll user"},
    {"old", "Ancient"},
    {"Old", "Ancient"},
    {"weapon", "tech"},
    {"Weapon", "Tech"},
    {"deployment", "tech"},
    {"Deployment", "Tech"},
    {"player primary", "tech"},
    {"Player Primary", "Tech"},
    {"deployment", "tech"},
    {"Deployment", "Tech"},
    {"hello", "greetings.."},
    {"Hello", "Greetings."},
    {"hi", "greetings."},
    {"Hi", "Greetings."},
    {"sup", "greetings."},
    {"Sup", "Greetings."},
    {"acce", "madok."},
    {"Acce", "Madok."},
  }
  
  function edgify(args)
  
    local clear = true -- remove custom codes, recommended
    local edge = true -- initial state
  
    local apostrophe = false
    local word = ""
    local i = 0
  
    for _ = 1, #args do
      i = i + 1
      if not apostrophe then
        if edge then
          for _, v in ipairs(t) do
            if string.lower(args:sub(i, i + #v[1] - 1)) == v[1] then
              local dif = #v[2] - #v[1]
              args = args:sub(1, i - 1) .. v[2] .. args:sub(i + #v[2] - dif)
              i = i + #v[1] + dif - 1
              break
            end
          end
        end
      else
        word = word .. args:sub(i, i)
      end
      if args:sub(i, i) == "^" then
        word = ""
        apostrophe = true
      elseif not args:sub(i, i):match("[%w%p]") then
        word = ""
        apostrophe = false
      elseif args:sub(i, i) == ";" then
        word = word:sub(1, -2)
        if word == "edge" then
          if clear then
            args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
            i = i - #word - 2
          end
          edge = true
        elseif word == "noedge" then
          if clear then
            args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
            i = i - #word - 2
          end
          edge = false
        end
        word = ""
        apostrophe = false
      end
    end
    
    return args
  end