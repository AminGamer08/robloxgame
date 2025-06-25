local GameServer = require(script.GameServer)

local server = GameServer.new()

-- Example usage
local player1 = "Player1"
local profile1 = server:AddPlayer(player1)
local planet = profile1:AddPlanet("Nova")
planet:AddFlora("GlowFern")
planet:ApplyHazard("SolarFlare")

-- Advance one tick
server:Tick()

print(player1 .. " stardust:", planet.Stardust)
