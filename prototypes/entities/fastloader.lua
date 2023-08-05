local fastest_belt = nil
for _, belt in pairs(data.raw["transport-belt"]) do
	if fastest_belt == nil then
		fastest_belt = belt
	else
		if belt.speed > fastest_belt.speed then
			fastest_belt = belt
		end
	end
end

-- now we need to create a loader for the fastest belt
local loader = util.table.deepcopy(data.raw["loader"]["loader"])
loader.name = "f2pl-fastest-loader"
loader.speed = fastest_belt.speed

data:extend { loader }
