local config = root.assetJson("/interface/tradAncien.config")
local gui = config.gui

function module.openInterface()
  player.interact("ScriptPane", config)
end