data.raw["map-gen-presets"].default["default-factorissimo-pt"] =
{
	order="f",
	basic_settings = {
		width=48,
		height=48,
		-- default_enable_all_autoplace_controls=false,
		autoplace_controls = {
			["enemy-base"] = {frequency=0}
		}, -- something to do with factorio not liking this being full and the above being false, it still loads in resources
	},
	advanced_settings = {
		pollution = {
			enabled=false,
		},
		enemy_evolution = {
			enabled=false,
		},
		enemy_expansion = {
			enabled=false
		},
	}
}
