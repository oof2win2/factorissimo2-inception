data:extend{{
    type = "container",
    icon = "__base__/graphics/icons/logistic-chest-requester.png",
    icon_mipmaps = 4,
    icon_size = 64,
    name = "blank-nonusable-chest",
    inventory_size = 100,
    picture = {
        layers = {{
            filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
            frame_count = 7,
            height = 38,
            hr_version = {
                filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-requester.png",
                frame_count = 7,
                height = 74,
                priority = "extra-high",
                scale = 0.5,
                shift = {0, -0.0625},
                width = 66
            },
            priority = "extra-high",
            shift = {0, -0.0625},
            width = 34
        }, {
            draw_as_shadow = true,
            filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
            height = 24,
            hr_version = {
                draw_as_shadow = true,
                filename = "__base__/graphics/entity/logistic-chest/hr-logistic-chest-shadow.png",
                height = 46,
                priority = "extra-high",
                repeat_count = 7,
                scale = 0.5,
                shift = {0.375, 0.140625},
                width = 112
            },
            priority = "extra-high",
            repeat_count = 7,
            shift = {0.375, 0.15625},
            width = 56
        }}
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
}}