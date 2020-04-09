
local t = {
  {"aa", "a"},
  {"AA", "A"},
  {"Aa", "Aa"},
  {"bb", "bb"},
  {"BB", "B"},
  {"Bb", "B"},
  {"cc", "c"},
  {"CC", "C"},
  {"Cc", "C"},
  {"dd", "d"},
  {"DD", "D"},
  {"Dd", "D"},
  {"gg", "Well played, Nice job everyone!"},
  {"GG", "Well you royally screwed that up, good job."},
  {"hh", "h"},
  {"HH", "H"},
  {"Hh", "H"},
  {"hMM", "*thonk*"},
  {"hmm", "*Thinking*"},
  {"HMM", "*Thinking Intensifies*"},
  {"II", "I"},
  {"Ii", "I"},
  {"jj", "j"},
  {"JJ", "J"},
  {"Jj", "J"},
  {"kk", "Okay"},
  {"KK", "WELL O K A Y THEN"},
  {"Kk", "K"},
  {"nn", "n"},
  {"NN", "N"},
  {"Nn", "N"},
  {"pp", "haha pp funny joke"},
  {"PP", "P"},
  {"Pp", "P"},
  {"qq", "q"},
  {"QQ", "Q"},
  {"Qq", "Q"},
  {"ss", "s"},
  {"SS", "S"},
  {"Ss", "S"},
  {"U", "You; yes you."},
  {"vv", "v"},
  {"VV", "V"},
  {"Vv", "V"},
  {"www", "Internet"},
  {"WW", "W"},
  {"Ww", "W"},
  {"yy", "y"},
  {"YY", "Y"},
  {"Yy", "Y"},
  {"zzz", "Sleepy time bois"},
}

function basic(args)

  local clear = true -- remove custom codes, recommended
  local command = true -- initial state

  local apostrophe = false
  local word = ""
  local i = 0

  for _ = 1, #args do
    i = i + 1
    if not apostrophe then
      if command then
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
      if word == "command" then
        if clear then
          args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
          i = i - #word - 2
        end
        command = true
      elseif word == "nocommand" then
        if clear then
          args = args:sub(1, i - #word - 2) .. args:sub(i + 1)
          i = i - #word - 2
        end
        command = false
      end
      word = ""
      apostrophe = false
    end
  end
  
  return args
end