local InputCombinatorEntity = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
InputCombinatorEntity.name = "factory-input-combinator"
InputCombinatorEntity.item_slot_count = 8
InputCombinatorEntity.minable = nil

-- local InputCombinatorItem = table.deepcopy(data.raw.item["constant-combinator"])
-- InputCombinatorItem.name = "factory-input-combinator"
-- InputCombinatorItem.place_result = "factory-input-combinator"
-- InputCombinatorItem.order = "c[combinator]-c[constant-combinator]-c[factory-input-combinator]"

-- local InputCombinatorRecipe = {
--     type = "recipe",
--     name = "factory-input-combinator",
--     ingredients = {},
--     result = "factory-input-combinator",
--     category = "crafting"
-- }

data:extend({
    InputCombinatorEntity
})