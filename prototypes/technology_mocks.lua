local mocks = {}
mocks.levels = {}
mocks.level1 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-1",
    order = "f-i-i",
    unit = {
        count = 100,
        ingredients = {{"automation-science-pack", 1}},
        time = 15
    }
}
mocks.levels.level2 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-2",
    order = "f-i-i",
    prerequisites = {"factory-extra-iron-ore-1"},
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1}
        },
        time = 15
    }
}
mocks.levels.level3 =  {
        type = "technology",
        icon = "__base__/graphics/icons/iron-ore.png",
        icon_mipmaps = 4,
        icon_size = 64,
        name = "factory-extra-iron-ore-3",
        order = "f-i-i",
        prerequisites = {"factory-extra-iron-ore-2"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1}, {"logistic-science-pack", 1}
            },
            time = 15
        }
}
mocks.levels.level4 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-4",
    order = "f-i-i",
    prerequisites = {"factory-extra-iron-ore-3"},
    unit = {
        count = 250,
        ingredients = {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        time = 15
    }
}
mocks.levels.level5 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-5",
    order = "f-i-i",
    prerequisites = {"factory-extra-iron-ore-4"},
    unit = {
        count = 500,
        ingredients = {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}, {"production-science-pack", 1}
        },
        time = 15
    }
}
mocks.levels.level6 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-6",
    order = "f-i-i",
    prerequisites = {"factory-extra-iron-ore-5"},
    unit = {
        count = 750,
        ingredients = {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}, {"production-science-pack", 1},
        },
        time = 15
    }
}
mocks.levels.level7 = {
    type = "technology",
    icon = "__base__/graphics/icons/iron-ore.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "factory-extra-iron-ore-7",
    order = "f-i-i",
    prerequisites = {"factory-extra-iron-ore-7"},
    unit = {
        count = 1000,
        ingredients = {
            {"automation-science-pack", 1}, {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}, {"production-science-pack", 1},
            {"utility-science-pack", 1}, {"space-science-pack", 1}
        },
        time = 15
    }
}
return mocks