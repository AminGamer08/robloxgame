local Planet = {}
Planet.__index = Planet

function Planet.new(name)
    local self = setmetatable({}, Planet)
    self.Name = name
    self.Flora = {}
    self.Stardust = 0
    self.Hazard = nil
    self.TechLevel = 1
    return self
end

function Planet:Terraform(processor)
    -- processor could be a table representing tech upgrades
    self.TechLevel = self.TechLevel + (processor and processor.Level or 1)
    -- Reset hazard after terraforming
    self.Hazard = nil
end

function Planet:AddFlora(flower)
    table.insert(self.Flora, flower)
end

function Planet:Harvest()
    -- Basic stardust yield depends on number of plants and tech level
    local yield = #self.Flora * self.TechLevel
    self.Stardust = self.Stardust + yield
    return yield
end

function Planet:ApplyHazard(hazard)
    self.Hazard = hazard
    -- Hazards reduce yield but may unlock mutations
    if hazard == "SolarFlare" then
        self.TechLevel = self.TechLevel + 1 -- unlock mutation
    end
end

return Planet
