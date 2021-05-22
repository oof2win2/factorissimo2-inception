local mocks = require("prototypes.technology_mocks")
local function create_research(resource)
    -- log(resource.name)
    local first = table.deepcopy(mocks.level1)
    log("creating research: " .. resource.name)
    local resourcename = resource.minable.results and resource.minable.results[1] and resource.minable.results[1].type == "fluid" and resource.name .. "-barrel" or resource.name
    log("resource name: " .. resourcename)
    -- log(serpent.line(resource.minable.results and resource.minable.results[1]))
    -- log(resource.minable.results and resource.minable.results[1] and (resource.minable.results[1].type .. "-barrel") or "unknown")
    local icon, icon_size = resource.icon, resource.icon_size
    if not icon then
        icon = resource.icons[1].icon
    end
    if not icon_size then
        icon_size = resource.icons[1].icon_size
    end
    first.name = "factory-extra-" .. resourcename .. "-1"
    first.icon = icon
    first.icon_size = icon_size
    first.icon_mipmaps = resource.icon_mipmaps
    if resource.localised_name then
        first.localised_name = {"", "Extra ", resource.localised_name}
    else
        first.localised_name = "Extra " .. resource.name
    end
    data:extend({first})
    local i = 2
    -- log(serpent.block(resource))
    for _, mock in pairs(mocks.levels) do
        local tech = table.deepcopy(mock)
        tech.name = "factory-extra-" .. resourcename  ..  "-" .. i
        tech.icon = icon
        tech.icon_size = icon_size
        tech.icon_mipmaps = resource.icon_mipmaps
        tech.prerequisites = {"factory-extra-" .. resourcename .. "-" .. i-1}
        if resource.localised_name then
            tech.localised_name = "Extra " .. resource.localised_name .. " " .. i
        else
            tech.localised_name = "Extra " .. resource.name .. " " ..i
        end
        -- log(tech.name)
        data:extend({tech})
        i = i + 1
    end
end

for _, resource in pairs(data.raw.resource) do
    create_research(resource)
end
