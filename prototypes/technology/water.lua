data:extend({
    {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-1",
        order = "f-i-w1",
        unit = {
            count = 100,
            ingredients = {{"automation-science-pack", 1}},
            time = 15
        },
        localised_name = "Extra Water"
    }, {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-2",
        order = "f-i-w2",
        prerequisites = {"factory-extra-water-barrel-1"},
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1}
            },
            time = 15
        },
        localised_name = "Extra Water 2"
    }, {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-3",
        order = "f-i-w3",
        prerequisites = {"factory-extra-water-barrel-2"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1}
            },
            time = 15
        },
        localised_name = "Extra Water 3"
    }, {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-4",
        order = "f-i-w4",
        prerequisites = {"factory-extra-water-barrel-3"},
        unit = {
            count = 250,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 15
        },
        localised_name = "Extra Water 4"
    }, {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-5",
        order = "f-i-w5",
        prerequisites = {"factory-extra-water-barrel-4"},
        unit = {
            count = 500,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1}
            },
            time = 15
        },
        localised_name = "Extra Water 5"
    },
    {
        type = "technology",
        icon = "__base__/graphics/icons/fluid/water.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-water-barrel-6",
        order = "f-i-w6",
        prerequisites = {"factory-extra-water-barrel-5"},
        unit = {
            count = 750,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}, {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 15
        },
        localised_name = "Extra Water 6"
    },
})
