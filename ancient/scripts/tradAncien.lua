require "/scripts/color.lua"
require "/scripts/owoify.lua"
require "/scripts/edgify.lua"
require "/scripts/basic.lua"

colorTimeShift = 1
colorTextShift = 10

counter = 0

function init()
    message = ""
    name = world.entityName(player.id())
end

function update()

    
   counter = counter + 2

    if message ~= "" then
        if widget.getChecked("owo") then
             message = owoify(message)
         end
         if widget.getChecked("edge") then
            message = edgify(message)
        end
        if widget.getChecked("basic") then
            message = basic(message)
        end
        local endText = ""
        for i = 1, message:len() do
            local shiftAmount = colorTextShift * i + colorTimeShift * counter
            endText = endText .. "^#"
            endText = endText .. color.hueshiftHex("ffffff",shiftAmount / 360) -- Does the hueshift color rotation stuff remove this and the line under and set the one above to be a solid colo
            endText = endText .. ";"
            endText = endText .. message:sub(i,i)
        end
        star.player.addChatMessage("["..name.."^reset;]: "..endText)
    end

    message = widget.getText("textboxMessage")
end


function uninit()
end

function type()
    
end
