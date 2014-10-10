-----------------------------------------
-------- Job Manager (Update 35) --------
-- Acepilot1023978: GUI Implementation --
------ B1313: Base code (functions) -----
-----------------------------------------
-- ESCAPE CHAIN (Current Difficulty)
EscapeCafeChain = function()
	managers.job:set_next_interupt_stage( "escape_cafe" )
	show_mid_text( "Escape Chain:", "Set to: Cafe", 3,5 )
end

EscapeCafeDayChain = function()
	managers.job:set_next_interupt_stage( "escape_cafe_day" )
	show_mid_text( "Escape Chain:", "Set to: Cafe (Day)", 3,5 )
end

EscapeParkChain = function()
	managers.job:set_next_interupt_stage( "escape_park" )
	show_mid_text( "Escape Chain:", "Set to: Park", 3,5 )
end

EscapeParkDayChain = function()
	managers.job:set_next_interupt_stage( "escape_park_day" )
	show_mid_text( "Escape Chain:", "Set to: Park (Day)", 3,5 )
end

EscapeOverPassChain = function()
	managers.job:set_next_interupt_stage( "escape_overpass" )
	show_mid_text( "Escape Chain:", "Set to: Overpass", 3,5 )
end

EscapeOverPassNightChain = function()
	managers.job:set_next_interupt_stage( "escape_overpass_night" )
	show_mid_text( "Escape Chain:", "Set to: Overpass (Night)", 3,5 )
end

EscapeStreetChain = function()
	managers.job:set_next_interupt_stage( "escape_street" )
	show_mid_text( "Escape Chain:", "Set to: Street", 3,5 )
end

EscapeGarageChain = function()
	managers.job:set_next_interupt_stage( "escape_garage" )
	show_mid_text( "Escape Chain:", "Set to: Garage", 3,5 )
end

-- ESCAPES (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- ESCAPE: GARAGE (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeGarageDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_garage"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeGarageOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_garage"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeGarageVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_garage"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeGarageHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_garage"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeGarageNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_garage"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: STREET (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeStreetDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_street"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeStreetOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_street"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeStreetVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_street"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeStreetHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_street"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeStreetNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_street"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: OVERPASS (NIGHT) (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeOverPassNightDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass_night"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassNightOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass_night"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassNightVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass_night"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassNightHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass_night"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassNightNormal = function()
	managers.job:activate_job ( "escape_overpass_night" )
	Global.game_settings.level_id = "escape_overpass_night"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: OVERPASS (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeOverPassDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_overpass"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeOverPassNormal = function()
	managers.job:activate_job ( "escape_overpass" )
	Global.game_settings.level_id = "escape_overpass"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: PARK (DAY) (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeParkDayDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkDayOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkDayVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkDayHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkDayNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: PARK (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeParkDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeParkNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_park"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end 

-- ESCAPE: CAFE (DAY) (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeCafeDayDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeDayOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeDayVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeDayHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeDayNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe_day"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ESCAPE: CAFE (Normal, Hard, Very Hard, OverKill, and DeathWish)
EscapeCafeDeathWish = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeOverKill = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeVeryHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeHard = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

EscapeCafeNormal = function()
	managers.job:activate_job ( "ukrainian_job" )
	Global.game_settings.level_id = "escape_cafe"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end
-- VLAD (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- UKRAINIAN JOB PRO JOB (Hard, Very Hard, OverKill, and DeathWish)
UkrainianJobPRODeathWish = function()
	managers.job:activate_job ( "ukrainian_job_prof" )
	Global.game_settings.level_id = "ukrainian_job"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

UkrainianJobPROOverKill = function()
	managers.job:activate_job ( "ukrainian_job_prof" )
	Global.game_settings.level_id = "ukrainian_job"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

UkrainianJobPROVeryHard = function()
	managers.job:activate_job ( "ukrainian_job_prof" )
	Global.game_settings.level_id = "ukrainian_job"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

UkrainianJobPROHard = function()
	managers.job:activate_job ( "ukrainian_job_prof" )
	Global.game_settings.level_id = "ukrainian_job"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- NIGHTCLUB (Normal, Hard, Very Hard, OverKill, and DeathWish)
NightclubDeathWish = function()
	managers.job:activate_job ( "nightclub" )
	Global.game_settings.level_id = "nightclub"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

NightclubOverKill = function()
	managers.job:activate_job ( "nightclub" )
	Global.game_settings.level_id = "nightclub"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

NightclubVeryHard = function()
	managers.job:activate_job ( "nightclub" )
	Global.game_settings.level_id = "nightclub"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

NightclubHard = function()
	managers.job:activate_job ( "nightclub" )
	Global.game_settings.level_id = "nightclub"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

NightclubNormal = function()
	managers.job:activate_job ( "nightclub" )
	Global.game_settings.level_id = "nightclub"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- MALLCRASHER (Normal, Hard, Very Hard, OverKill, and DeathWish)
MallCrasherDeathWish = function()
	managers.job:activate_job ( "mallcrasher" )
	Global.game_settings.level_id = "mallcrasher"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

MallCrasherOverKill = function()
	managers.job:activate_job ( "mallcrasher" )
	Global.game_settings.level_id = "mallcrasher"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

MallCrasherVeryHard = function()
	managers.job:activate_job ( "mallcrasher" )
	Global.game_settings.level_id = "mallcrasher"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

MallCrasherHard = function()
	managers.job:activate_job ( "mallcrasher" )
	Global.game_settings.level_id = "mallcrasher"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

MallCrasherNormal = function()
	managers.job:activate_job ( "mallcrasher" )
	Global.game_settings.level_id = "mallcrasher"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FOUR STORES (Normal, Hard, Very Hard, OverKill, and DeathWish)
FourStoresDeathWish = function()
	managers.job:activate_job ( "four_stores" )
	Global.game_settings.level_id = "four_stores"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FourStoresOverKill = function()
	managers.job:activate_job ( "four_stores" )
	Global.game_settings.level_id = "four_stores"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FourStoresVeryHard = function()
	managers.job:activate_job ( "four_stores" )
	Global.game_settings.level_id = "four_stores"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FourStoresHard = function()
	managers.job:activate_job ( "four_stores" )
	Global.game_settings.level_id = "four_stores"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FourStoresNormal = function()
	managers.job:activate_job ( "four_stores" )
	Global.game_settings.level_id = "four_stores"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end


-- THE ELEPHANT (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- ELECTION DAY PRO JOB DAY 3 (Hard, Very Hard, OverKill, and DeathWish)
ElectionDayPRODay3DeathWish = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay3OverKill = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay3VeryHard = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay3Hard = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- ELECTION DAY PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
ElectionDayPRODay2DeathWish = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay2OverKill = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay2VeryHard = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay2Hard = function()
	managers.job:activate_job ( "election_day_prof", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- ELECTION DAY PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
ElectionDayPRODay1DeathWish = function()
	managers.job:activate_job ( "election_day_prof" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay1OverKill = function()
	managers.job:activate_job ( "election_day_prof" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay1VeryHard = function()
	managers.job:activate_job ( "election_day_prof" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayPRODay1Hard = function()
	managers.job:activate_job ( "election_day_prof" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- BIG OIL PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
BigOilPRODay2DeathWish = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof", 2 )
	Global.game_settings.level_id = "welcome_to_the_jungle_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay2OverKill = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof", 2 )
	Global.game_settings.level_id = "welcome_to_the_jungle_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay2VeryHard = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof", 2 )
	Global.game_settings.level_id = "welcome_to_the_jungle_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay2Hard = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof", 2 )
	Global.game_settings.level_id = "welcome_to_the_jungle_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- BIG OIL PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
BigOilPRODay1DeathWish = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof" )
	Global.game_settings.level_id = "welcome_to_the_jungle_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay1OverKill = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof" )
	Global.game_settings.level_id = "welcome_to_the_jungle_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay1VeryHard = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof" )
	Global.game_settings.level_id = "welcome_to_the_jungle_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BigOilPRODay1Hard = function()
	managers.job:activate_job ( "welcome_to_the_jungle_prof" )
	Global.game_settings.level_id = "welcome_to_the_jungle_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME PRO JOB DAY 3 (Hard, Very Hard, OverKill, and DeathWish)
FramingFramePRODay3DeathWish = function()
	managers.job:activate_job ( "framing_frame_prof", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay3OverKill = function()
	managers.job:activate_job ( "framing_frame_prof", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay3VeryHard = function()
	managers.job:activate_job ( "framing_frame_prof", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay3Hard = function()
	managers.job:activate_job ( "framing_frame_prof", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
FramingFramePRODay2DeathWish = function()
	managers.job:activate_job ( "framing_frame_prof", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay2OverKill = function()
	managers.job:activate_job ( "framing_frame_prof", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay2VeryHard = function()
	managers.job:activate_job ( "framing_frame_prof", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay2Hard = function()
	managers.job:activate_job ( "framing_frame_prof", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
FramingFramePRODay1DeathWish = function()
	managers.job:activate_job ( "framing_frame_prof" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay1OverKill = function()
	managers.job:activate_job ( "framing_frame_prof" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay1VeryHard = function()
	managers.job:activate_job ( "framing_frame_prof" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFramePRODay1Hard = function()
	managers.job:activate_job ( "framing_frame_prof" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- ELECTION DAY DAY 3 (Normal, Hard, Very Hard, OverKill, and DeathWish)
ElectionDayDay3DeathWish = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay3OverKill = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay3VeryHard = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay3Hard = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay3Normal = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end    

-- ELECTION DAY DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
ElectionDayDay2DeathWish = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay2OverKill = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay2VeryHard = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay2Hard = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay2Normal = function()
	managers.job:activate_job ( "election_day", 2 )
	Global.game_settings.level_id = "election_day_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ELECTION DAY DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
ElectionDayDay1DeathWish = function()
	managers.job:activate_job ( "election_day" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay1OverKill = function()
	managers.job:activate_job ( "election_day" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay1VeryHard = function()
	managers.job:activate_job ( "election_day" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay1Hard = function()
	managers.job:activate_job ( "election_day" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

ElectionDayDay1Normal = function()
	managers.job:activate_job ( "election_day" )
	Global.game_settings.level_id = "election_day_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME DAY 3 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FramingFrameDay3DeathWish = function()
	managers.job:activate_job ( "framing_frame", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay3OverKill = function()
	managers.job:activate_job ( "framing_frame", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay3VeryHard = function()
	managers.job:activate_job ( "framing_frame", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay3Hard = function()
	managers.job:activate_job ( "framing_frame", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay3Normal = function()
	managers.job:activate_job ( "framing_frame", 3 )
	Global.game_settings.level_id = "framing_frame_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FramingFrameDay2DeathWish = function()
	managers.job:activate_job ( "framing_frame", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay2OverKill = function()
	managers.job:activate_job ( "framing_frame", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay2VeryHard = function()
	managers.job:activate_job ( "framing_frame", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay2Hard = function()
	managers.job:activate_job ( "framing_frame", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay2Normal = function()
	managers.job:activate_job ( "framing_frame", 2 )
	Global.game_settings.level_id = "framing_frame_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FRAMING FRAME DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FramingFrameDay1DeathWish = function()
	managers.job:activate_job ( "framing_frame" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay1OverKill = function()
	managers.job:activate_job ( "framing_frame" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay1VeryHard = function()
	managers.job:activate_job ( "framing_frame" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay1Hard = function()
	managers.job:activate_job ( "framing_frame" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FramingFrameDay1Normal = function()
	managers.job:activate_job ( "framing_frame" )
	Global.game_settings.level_id = "framing_frame_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- HECTOR (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- RATS PRO JOB DAY 3 (Hard, Very Hard, OverKill, and DeathWish)
RatsPRODay3DeathWish = function()
	managers.job:activate_job ( "alex_prof", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay3OverKill = function()
	managers.job:activate_job ( "alex_prof", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay3VeryHard = function()
	managers.job:activate_job ( "alex_prof", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay3Hard = function()
	managers.job:activate_job ( "alex_prof", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- RATS PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
RatsPRODay2DeathWish = function()
	managers.job:activate_job ( "alex_prof", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay2OverKill = function()
	managers.job:activate_job ( "alex_prof", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay2VeryHard = function()
	managers.job:activate_job ( "alex_prof", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay2Hard = function()
	managers.job:activate_job ( "alex_prof", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- RATS PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
RatsPRODay1DeathWish = function()
	managers.job:activate_job ( "alex_prof" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay1OverKill = function()
	managers.job:activate_job ( "alex_prof" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay1VeryHard = function()
	managers.job:activate_job ( "alex_prof" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsPRODay1Hard = function()
	managers.job:activate_job ( "alex_prof" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER PRO JOB DAY 3 (Hard, Very Hard, OverKill, and DeathWish)
FireStarterPRODay3DeathWish = function()
	managers.job:activate_job ( "firestarter_prof", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay3OverKill = function()
	managers.job:activate_job ( "firestarter_prof", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay3VeryHard = function()
	managers.job:activate_job ( "firestarter_prof", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay3Hard = function()
	managers.job:activate_job ( "firestarter_prof", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
FireStarterPRODay2DeathWish = function()
	managers.job:activate_job ( "firestarter_prof", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay2OverKill = function()
	managers.job:activate_job ( "firestarter_prof", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay2VeryHard = function()
	managers.job:activate_job ( "firestarter_prof", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay2Hard = function()
	managers.job:activate_job ( "firestarter_prof", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
FireStarterPRODay1DeathWish = function()
	managers.job:activate_job ( "firestarter_prof" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay1OverKill = function()
	managers.job:activate_job ( "firestarter_prof" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay1VeryHard = function()
	managers.job:activate_job ( "firestarter_prof" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterPRODay1Hard = function()
	managers.job:activate_job ( "firestarter_prof" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- WATCHDOGS PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
WatchdogsPRODay2DeathWish = function()
	managers.job:activate_job ( "watchdogs_prof", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay2OverKill = function()
	managers.job:activate_job ( "watchdogs_prof", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay2VeryHard = function()
	managers.job:activate_job ( "watchdogs_prof", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay2Hard = function()
	managers.job:activate_job ( "watchdogs_prof", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- WATCHDOGS PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
WatchdogsPRODay1DeathWish = function()
	managers.job:activate_job ( "watchdogs_prof" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay1OverKill = function()
	managers.job:activate_job ( "watchdogs_prof" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay1VeryHard = function()
	managers.job:activate_job ( "watchdogs_prof" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsPRODay1Hard = function()
	managers.job:activate_job ( "watchdogs_prof" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end


-- RATS DAY 3 (Normal, Hard, Very Hard, OverKill, and DeathWish)
RatsDay3DeathWish = function()
	managers.job:activate_job ( "alex", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay3OverKill = function()
	managers.job:activate_job ( "alex", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay3VeryHard = function()
	managers.job:activate_job ( "alex", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay3Hard = function()
	managers.job:activate_job ( "alex", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay3Normal = function()
	managers.job:activate_job ( "alex", 3 )
	Global.game_settings.level_id = "alex_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- RATS DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
RatsDay2DeathWish = function()
	managers.job:activate_job ( "alex", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay2OverKill = function()
	managers.job:activate_job ( "alex", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay2VeryHard = function()
	managers.job:activate_job ( "alex", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay2Hard = function()
	managers.job:activate_job ( "alex", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay2Normal = function()
	managers.job:activate_job ( "alex", 2 )
	Global.game_settings.level_id = "alex_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- RATS DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
RatsDay1DeathWish = function()
	managers.job:activate_job ( "alex" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay1OverKill = function()
	managers.job:activate_job ( "alex" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay1VeryHard = function()
	managers.job:activate_job ( "alex" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay1Hard = function()
	managers.job:activate_job ( "alex" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

RatsDay1Normal = function()
	managers.job:activate_job ( "alex" )
	Global.game_settings.level_id = "alex_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER DAY 3 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FireStarterDay3DeathWish = function()
	managers.job:activate_job ( "firestarter", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay3OverKill = function()
	managers.job:activate_job ( "firestarter", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay3VeryHard = function()
	managers.job:activate_job ( "firestarter", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay3Hard = function()
	managers.job:activate_job ( "firestarter", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay3Normal = function()
	managers.job:activate_job ( "firestarter", 3 )
	Global.game_settings.level_id = "firestarter_3"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FireStarterDay2DeathWish = function()
	managers.job:activate_job ( "firestarter", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay2OverKill = function()
	managers.job:activate_job ( "firestarter", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay2VeryHard = function()
	managers.job:activate_job ( "firestarter", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay2Hard = function()
	managers.job:activate_job ( "firestarter", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay2Normal = function()
	managers.job:activate_job ( "firestarter", 2 )
	Global.game_settings.level_id = "firestarter_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- FIRESTARTER DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
FireStarterDay1DeathWish = function()
	managers.job:activate_job ( "firestarter" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay1OverKill = function()
	managers.job:activate_job ( "firestarter" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay1VeryHard = function()
	managers.job:activate_job ( "firestarter" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay1Hard = function()
	managers.job:activate_job ( "firestarter" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

FireStarterDay1Normal = function()
	managers.job:activate_job ( "firestarter" )
	Global.game_settings.level_id = "firestarter_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- WATCHDOGS DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
WatchdogsDay2DeathWish = function()
	managers.job:activate_job ( "watchdogs", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay2OverKill = function()
	managers.job:activate_job ( "watchdogs", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay2VeryHard = function()
	managers.job:activate_job ( "watchdogs", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay2Hard = function()
	managers.job:activate_job ( "watchdogs", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay2Normal = function()
	managers.job:activate_job ( "watchdogs", 2 )
	Global.game_settings.level_id = "watchdogs_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- WATCHDOGS DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
WatchdogsDay1DeathWish = function()
	managers.job:activate_job ( "watchdogs" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay1OverKill = function()
	managers.job:activate_job ( "watchdogs" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay1VeryHard = function()
	managers.job:activate_job ( "watchdogs" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay1Hard = function()
	managers.job:activate_job ( "watchdogs" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

WatchdogsDay1Normal = function()
	managers.job:activate_job ( "watchdogs" )
	Global.game_settings.level_id = "watchdogs_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- THE DENTIST (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- MIAMI HOTLINE PRO JOB DAY 2 (Hard, Very Hard, OverKill, and DeathWish)
HotlineMiamiPRODay2DeathWish = function()
	managers.job:activate_job ( "mia_prof", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay2OverKill = function()
	managers.job:activate_job ( "mia_prof", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay2VeryHard = function()
	managers.job:activate_job ( "mia_prof", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay2Hard = function()
	managers.job:activate_job ( "mia_prof", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

--MIAMI HOTLINE PRO JOB DAY 1 (Hard, Very Hard, OverKill, and DeathWish)
HotlineMiamiPRODay1DeathWish = function()
	managers.job:activate_job ( "mia_prof" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay1OverKill = function()
	managers.job:activate_job ( "mia_prof" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay1VeryHard = function()
	managers.job:activate_job ( "mia_prof" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiPRODay1Hard = function()
	managers.job:activate_job ( "mia_prof" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- THE BIG BANK (Normal, Hard, Very Hard, OverKill, and DeathWish)
BigBankDeathWish = function()
	managers.job:activate_job ( "big" )
	Global.game_settings.level_id = "big"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BigBankOverKill = function()
	managers.job:activate_job ( "big" )
	Global.game_settings.level_id = "big"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BigBankVeryHard = function()
	managers.job:activate_job ( "big" )
	Global.game_settings.level_id = "big"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BigBankHard = function()
	managers.job:activate_job ( "big" )
	Global.game_settings.level_id = "big"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

BigBankNormal = function()
	managers.job:activate_job ( "big" )
	Global.game_settings.level_id = "big"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

--MIAMI HOTLINE DAY 2 (Normal, Hard, Very Hard, OverKill, and DeathWish)
HotlineMiamiDay2DeathWish = function()
	managers.job:activate_job ( "mia", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay2OverKill = function()
	managers.job:activate_job ( "mia", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay2VeryHard = function()
	managers.job:activate_job ( "mia", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay2Hard = function()
	managers.job:activate_job ( "mia", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay2Normal = function()
	managers.job:activate_job ( "mia", 2 )
	Global.game_settings.level_id = "mia_2"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

--MIAMI HOTLINE DAY 1 (Normal, Hard, Very Hard, OverKill, and DeathWish)
HotlineMiamiDay1DeathWish = function()
	managers.job:activate_job ( "mia" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay1OverKill = function()
	managers.job:activate_job ( "mia" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay1VeryHard = function()
	managers.job:activate_job ( "mia" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay1Hard = function()
	managers.job:activate_job ( "mia" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

HotlineMiamiDay1Normal = function()
	managers.job:activate_job ( "mia" )
	Global.game_settings.level_id = "mia_1"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- BAIN DLC (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- SHADOW RAID (Normal, Hard, Very Hard, OverKill, and DeathWish)
ShadowRaidDeathWish = function()
	managers.job:activate_job ( "kosugi" )
	Global.game_settings.level_id = "kosugi"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

ShadowRaidOverKill = function()
	managers.job:activate_job ( "kosugi" )
	Global.game_settings.level_id = "kosugi"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

ShadowRaidVeryHard = function()
	managers.job:activate_job ( "kosugi" )
	Global.game_settings.level_id = "kosugi"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

ShadowRaidHard = function()
	managers.job:activate_job ( "kosugi" )
	Global.game_settings.level_id = "kosugi"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

ShadowRaidNormal = function()
	managers.job:activate_job ( "kosugi" )
	Global.game_settings.level_id = "kosugi"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- GO BANK (Normal, Hard, Very Hard, OverKill, and DeathWish)
GOBankDeathWish = function()
	managers.job:activate_job ( "roberts" )
	Global.game_settings.level_id = "roberts"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

GOBankOverKill = function()
	managers.job:activate_job ( "roberts" )
	Global.game_settings.level_id = "roberts"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

GOBankVeryHard = function()
	managers.job:activate_job ( "roberts" )
	Global.game_settings.level_id = "roberts"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

GOBankHard = function()
	managers.job:activate_job ( "roberts" )
	Global.game_settings.level_id = "roberts"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

GOBankNormal = function()
	managers.job:activate_job ( "roberts" )
	Global.game_settings.level_id = "roberts"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRAIN HEIST (Normal, Hard, Very Hard, OverKill, and DeathWish)
TrainHeistDeathWish = function()
	managers.job:activate_job ( "arm_for" )
	Global.game_settings.level_id = "arm_for"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TrainHeistOverKill = function()
	managers.job:activate_job ( "arm_for" )
	Global.game_settings.level_id = "arm_for"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TrainHeistVeryHard = function()
	managers.job:activate_job ( "arm_for" )
	Global.game_settings.level_id = "arm_for"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TrainHeistHard = function()
	managers.job:activate_job ( "arm_for" )
	Global.game_settings.level_id = "arm_for"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TrainHeistNormal = function()
	managers.job:activate_job ( "arm_for" )
	Global.game_settings.level_id = "arm_for"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRANSPORT PARK (Normal, Hard, Very Hard, OverKill, and DeathWish)
TransportParkDeathWish = function()
	managers.job:activate_job ( "arm_par" )
	Global.game_settings.level_id = "arm_par"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TransportParkOverKill = function()
	managers.job:activate_job ( "arm_par" )
	Global.game_settings.level_id = "arm_par"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TransportParkVeryHard = function()
	managers.job:activate_job ( "arm_par" )
	Global.game_settings.level_id = "arm_par"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TransportParkHard = function()
	managers.job:activate_job ( "arm_par" )
	Global.game_settings.level_id = "arm_par"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TransportParkNormal = function()
	managers.job:activate_job ( "arm_par" )
	Global.game_settings.level_id = "arm_par"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRANSPORT UNDERPASS (Normal, Hard, Very Hard, OverKill, and DeathWish)
TransportUnderPassDeathWish = function()
	managers.job:activate_job ( "arm_und" )
	Global.game_settings.level_id = "arm_und"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TransportUnderPassOverKill = function()
	managers.job:activate_job ( "arm_und" )
	Global.game_settings.level_id = "arm_und"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TransportUnderPassVeryHard = function()
	managers.job:activate_job ( "arm_und" )
	Global.game_settings.level_id = "arm_und"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TransportUnderPassHard = function()
	managers.job:activate_job ( "arm_und" )
	Global.game_settings.level_id = "arm_und"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TransportUnderPassNormal = function()
	managers.job:activate_job ( "arm_und" )
	Global.game_settings.level_id = "arm_und"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRANSPORT HARBOUR (Normal, Hard, Very Hard, OverKill, and DeathWish)
TransportHarbourDeathWish = function()
	managers.job:activate_job ( "arm_fac" )
	Global.game_settings.level_id = "arm_fac"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TransportHarbourOverKill = function()
	managers.job:activate_job ( "arm_fac" )
	Global.game_settings.level_id = "arm_fac"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TransportHarbourVeryHard = function()
	managers.job:activate_job ( "arm_fac" )
	Global.game_settings.level_id = "arm_fac"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TransportHarbourHard = function()
	managers.job:activate_job ( "arm_fac" )
	Global.game_settings.level_id = "arm_fac"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TransportHarbourNormal = function()
	managers.job:activate_job ( "arm_fac" )
	Global.game_settings.level_id = "arm_fac"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRANSPORT DOWNTOWN (Normal, Hard, Very Hard, OverKill, and DeathWish)
TransportDownTownDeathWish = function()
	managers.job:activate_job ( "arm_hcm" )
	Global.game_settings.level_id = "arm_hcm"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TransportDownTownOverKill = function()
	managers.job:activate_job ( "arm_hcm" )
	Global.game_settings.level_id = "arm_hcm"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TransportDownTownVeryHard = function()
	managers.job:activate_job ( "arm_hcm" )
	Global.game_settings.level_id = "arm_hcm"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TransportDownTownHard = function()
	managers.job:activate_job ( "arm_hcm" )
	Global.game_settings.level_id = "arm_hcm"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TransportDownTownNormal = function()
	managers.job:activate_job ( "arm_hcm" )
	Global.game_settings.level_id = "arm_hcm"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- ARMORED TRANSPORT: TRANSPORT CROSSROADS (Normal, Hard, Very Hard, OverKill, and DeathWish)
TransportCrossRoadsDeathWish = function()
	managers.job:activate_job ( "arm_cro" )
	Global.game_settings.level_id = "arm_cro"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

TransportCrossRoadsOverKill = function()
	managers.job:activate_job ( "arm_cro" )
	Global.game_settings.level_id = "arm_cro"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

TransportCrossRoadsVeryHard = function()
	managers.job:activate_job ( "arm_cro" )
	Global.game_settings.level_id = "arm_cro"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

TransportCrossRoadsHard = function()
	managers.job:activate_job ( "arm_cro" )
	Global.game_settings.level_id = "arm_cro"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

TransportCrossRoadsNormal = function()
	managers.job:activate_job ( "arm_cro" )
	Global.game_settings.level_id = "arm_cro"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- BAIN CLASSIC (Normal, Hard, Very Hard, OverKill, and DeathWish)
-- BANK HEIST: PRO JOB (Hard, Very Hard, OverKill, and DeathWish)
BankPRODeathWish = function()
	managers.job:activate_job ( "branchbank_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BankPROOverKill = function()
	managers.job:activate_job ( "branchbank_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BankPROVeryHard = function()
	managers.job:activate_job ( "branchbank_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BankPROHard = function()
	managers.job:activate_job ( "branchbank_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- BANK HEIST: GOLD PRO JOB (Hard, Very Hard, OverKill, and DeathWish)
BankGoldPRODeathWish = function()
	managers.job:activate_job ( "branchbank_gold_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BankGoldPROOverKill = function()
	managers.job:activate_job ( "branchbank_gold_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BankGoldPROVeryHard = function()
	managers.job:activate_job ( "branchbank_gold_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BankGoldPROHard = function()
	managers.job:activate_job ( "branchbank_gold_prof" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

-- DIAMOND STORE (Normal, Hard, Very Hard, OverKill, and DeathWish)
DiamondStoreDeathWish = function()
	managers.job:activate_job ( "family" )
	Global.game_settings.level_id = "family"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

DiamondStoreOverKill = function()
	managers.job:activate_job ( "family" )
	Global.game_settings.level_id = "family"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

DiamondStoreVeryHard = function()
	managers.job:activate_job ( "family" )
	Global.game_settings.level_id = "family"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

DiamondStoreHard = function()
	managers.job:activate_job ( "family" )
	Global.game_settings.level_id = "family"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

DiamondStoreNormal = function()
	managers.job:activate_job ( "family" )
	Global.game_settings.level_id = "family"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- BANK HEIST: DEPOSIT (Normal, Hard, Very Hard, OverKill, and DeathWish)
BankDepositDeathWish = function()
	managers.job:activate_job ( "branchbank_deposit" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BankDepositOverKill = function()
	managers.job:activate_job ( "branchbank_deposit" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BankDepositVeryHard = function()
	managers.job:activate_job ( "branchbank_deposit" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BankDepositHard = function()
	managers.job:activate_job ( "branchbank_deposit" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

BankDepositNormal = function()
	managers.job:activate_job ( "branchbank_deposit" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- BANK HEIST: CASH (Normal, Hard, Very Hard, OverKill, and DeathWish)
BankCashDeathWish = function()
	managers.job:activate_job ( "branchbank" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

BankCashOverKill = function()
	managers.job:activate_job ( "branchbank" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

BankCashVeryHard = function()
	managers.job:activate_job ( "branchbank" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

BankCashHard = function()
	managers.job:activate_job ( "branchbank" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

BankCashNormal = function()
	managers.job:activate_job ( "branchbank" )
	Global.game_settings.level_id = "branchbank"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end

-- JEWELRY STORE (Normal, Hard, Very Hard, OverKill, and DeathWish)
JewelryStoreDeathWish = function()
	managers.job:activate_job ( "jewelry_store" )
	Global.game_settings.level_id = "jewelry_store"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_290"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_290", "friends", nil, nil, 1, 1, 1 } } )
end

JewelryStoreOverKill = function()
	managers.job:activate_job ( "jewelry_store" )
	Global.game_settings.level_id = "jewelry_store"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill_145"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill_145", "friends", nil, nil, 1, 1, 1 } } )
end

JewelryStoreVeryHard = function()
	managers.job:activate_job ( "jewelry_store" )
	Global.game_settings.level_id = "jewelry_store"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "overkill"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "overkill", "friends", nil, nil, 1, 1, 1 } } )
end

JewelryStoreHard = function()
	managers.job:activate_job ( "jewelry_store" )
	Global.game_settings.level_id = "jewelry_store"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "hard"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "hard", "friends", nil, nil, 1, 1, 1 } } )
end

JewelryStoreNormal = function()
	managers.job:activate_job ( "jewelry_store" )
	Global.game_settings.level_id = "jewelry_store"
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = "normal"
	local level_id = tweak_data.levels:get_index_from_level_id( Global.game_settings.level_id )
	local job_id = tweak_data.narrative:get_index_from_job_id( managers.job:current_job_id() )
	managers.network.matchmake:create_lobby( { numbers = { level_id, "normal", "friends", nil, nil, 1, 1, 1 } } )
end
