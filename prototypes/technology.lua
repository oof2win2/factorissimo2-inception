local mocks = require("prototypes.technology_mocks")
local function create_research(resource)
    local first = table.deepcopy(mocks.level1)
    first.icon = resource.icon
    first.name = "factory-extra-" .. resource.name .. "-1"
    first.icon_size = resource.icon_size
    first.icon_mipmaps = resource.icon_mipmaps
    if resource.localised_name then
        first.localised_name = "Extra " .. resource.localised_name
    else
        first.localised_name = "Extra " .. resource.name
    end
    data:extend({first})
    local i = 2
    log(first.name)
    for _, mock in pairs(mocks.levels) do
        local tech = table.deepcopy(mock)
        tech.name = "factory-extra-" .. resource.name .. "-" .. i
        tech.icon = resource.icon
        tech.icon_size = resource.icon_size
        tech.icon_mipmaps = resource.icon_mipmaps
        tech.prerequisites = {"factory-extra-" .. resource.name .. "-" .. i-1}
        if resource.localised_name then
            tech.localised_name = "Extra " .. resource.localised_name .. " " .. i
        else
            tech.localised_name = "Extra " .. resource.name .. " " ..i
        end
        log(tech.name)
        data:extend({tech})
        i = i + 1
    end
end

for _, resource in pairs(data.raw.resource) do
    create_research(resource)
end