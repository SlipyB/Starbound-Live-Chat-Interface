
local t = {
  {"brb", "brb"},
  {"rip", "rip"},
  {"lol", "lol"},
  {"lul", "lul"},
  {"lmao", "lmao"},
  {"lmfao", "lmfao"},
  {"rawr", "rawr"},
  {"l", "w"},
  {"r", "w"},
  {"L", "W"},
  {"R", "W"},
  {"na", "nya"},
  {"ne", "nye"},
  {"ni", "nyi"},
  {"no", "nyo"},
  {"nu", "nyu"},
  {"Na", "Nya"},
  {"Ne", "Nye"},
  {"Ni", "Nyi"},
  {"No", "Nyo"},
  {"Nu", "Nyu"},
  {"NA", "NYA"},
  {"NE", "NYE"},
  {"NI", "NYI"},
  {"NO", "NYO"},
  {"NU", "NYU"},
}
-- Purr Made This 
function owoify(args)

  local clear = true -- remove custom codes, recommended
  local fur = true -- initial state

  local apostrophe = false
  local word = ""
  local i = 0

  for _ = 1, #args do
    i = i + 1
    if not apostrophe then
      if fur then
        for _, v in ipairs(t) do
          if args:sub(i, i + #v[1] - 1) == v[1] then
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
      if word == "fur" then
        if clear then
          args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
          i = i - #word - 2
        end
        fur = true
      elseif word == "nofur" then
        if clear then
          args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
          i = i - #word - 2
        end
        fur = false
      end
      word = ""
      apostrophe = false
    end
  end
  
  return args
end
