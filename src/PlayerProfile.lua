local Planet = require(script.Parent.Planet)

local PlayerProfile = {}
PlayerProfile.__index = PlayerProfile

function PlayerProfile.new(player)
    local self = setmetatable({}, PlayerProfile)
    self.Player = player
    self.Planets = {}
    self.NaniteBuff = 1
    self.Prestige = 0
    return self
end

function PlayerProfile:AddPlanet(name)
    local planet = Planet.new(name)
    table.insert(self.Planets, planet)
    return planet
end

function PlayerProfile:HarvestAll()
    local total = 0
    for _, planet in ipairs(self.Planets) do
        total = total + planet:Harvest() * self.NaniteBuff
    end
    return total
end

function PlayerProfile:PrestigeReset()
    self.Prestige = self.Prestige + 1
    self.NaniteBuff = self.NaniteBuff + 0.1
    for _, planet in ipairs(self.Planets) do
        planet.Stardust = 0
        planet.TechLevel = 1
        planet.Flora = {}
    end
end

return PlayerProfile
