data:extend({
    {
        type = "technology",
        icon = "__base__/graphics/icons/fast-transport-belt.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-input-belt-2",
        order = "f-i-b3",
        prerequisites = {"logistics-2"},
        unit = {
            count = 250,
            ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}},
            time = 15
        },
    },
    {
        type = "technology",
        icon = "__base__/graphics/icons/express-transport-belt.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-input-belt-3",
        order = "f-i-b3",
        prerequisites = {"logistics-3", "factory-input-belt-2"},
        unit = {
            count = 500,
            ingredients = {{"automation-science-pack", 1}, {"logistic-science-pack", 1}, {"chemical-science-pack", 1}, {"production-science-pack", 1}},
            time = 15
        },
        localised_name = "Extra Water"
    }
})