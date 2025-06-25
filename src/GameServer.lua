local PlayerProfile = require(script.PlayerProfile)

local GameServer = {}
GameServer.__index = GameServer

function GameServer.new()
    local self = setmetatable({}, GameServer)
    self.Players = {}
    return self
end

function GameServer:AddPlayer(player)
    local profile = PlayerProfile.new(player)
    self.Players[player] = profile
    return profile
end

function GameServer:GetProfile(player)
    return self.Players[player]
end

function GameServer:Tick()
    -- This would be run each server tick to progress planets
    for _, profile in pairs(self.Players) do
        for _, planet in ipairs(profile.Planets) do
            if planet.Hazard then
                planet.Stardust = planet.Stardust - 1
            else
                planet.Stardust = planet.Stardust + planet.TechLevel
            end
        end
    end
end

return GameServer
