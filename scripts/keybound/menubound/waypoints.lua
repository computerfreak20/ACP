if inGame() and isPlaying() then
	local job = managers.job:current_level_id()
	local hud = managers.hud
	_toggleWaypoint = not _toggleWaypoint
	_keyboard_used = _keyboard_used or false
	_FF3_used = _FF3_used or false
	_gps_used = _gps_used or false
	_pc_used = _pc_used or false
	_engine_used = _engine_used or false
	_intel_used = _intel_used or false
	bo_boxes = bo_boxes or {}
	SecBox1 = SecBox1 --or ""
	SecBox2 = SecBox2 --or ""
	_box1_used = _box1_used or false
	_box2_used = _box2_used or false
	_drill1_used = _drill1_used or false
	_drill2_used = _drill2_used or false
	_drill3_used = _drill3_used or false
	_tiara_used = _tiara_used or false
	tabclk = tabclk or {}
	clientBox = clientBox or {}
	clientSucceed = clientSucceed or 0
	cm = managers.controller
	nb = nb or 0
	loopbig = 0
	
	keyboard = Input:keyboard()
	if keyboard:pressed() ~= nil then
		beep()
	end
		
	if _toggleWaypoint then
	else
		RefreshItemWaypoints()
	end

	--speed up waypoint display
	managers.hud.__update_waypoints = managers.hud.__update_waypoints or managers.hud._update_waypoints 
	function HUDManager:_update_waypoints( t, dt ) 
		local result = self:__update_waypoints(t,dt) 
		for id,data in pairs( self._hud.waypoints ) do 
			id = tostring(id) 
			if id:sub(1,5)=='hudz_' or id:sub(1,5)=='hudb_' then 
				data.move_speed = 0.01
				data.bitmap:set_color( data.bitmap:color():with_alpha( 0.3 ) ) -- OPACITY : YOU CAN CHANGE THE VALUE (0-1)
			end 
		end 
		return result 
	end  

	function RefreshItemWaypoints()
		local lp = 1
		Color.orange = Color("FF8800")
		--clear all created waypoints
		for id,_ in pairs( clone( managers.hud._hud.waypoints ) ) do
			id = tostring(id)
			if id:sub(1,5)=='hudz_' or id:sub(1,5)=='hudb_' then
				managers.hud:remove_waypoint( id ) 
			end
		end
		if _toggleWaypoint then
			--create new waypoints for remaining items
			for k,v in pairs(managers.interaction._interactive_objects) do
			
				local interact = v:interaction().tweak_data
				local pos = v:position()
				--GO Bank stuff
				if job == 'roberts' then
					--Count keycards sitting on map
					local _keycardspawned = -1 --always one keycard on the map that spawns out of bounds..
					for l,w in pairs(managers.interaction._interactive_objects) do
						if w:interaction().tweak_data == 'pickup_keycard' then _keycardspawned = _keycardspawned + 1 end
					end
					
					--Count keycards on civs
					local _keycardsoncivs = 0
					for u_key,u_data in pairs(managers.enemy:all_civilians()) do
						if alive(u_data.unit) and isHost() and u_data.unit:character_damage():pickup() then _keycardsoncivs = _keycardsoncivs + 1 end
					end  
					
					--Count briefcases
					local _briefcases = 0
					for l,w in pairs(managers.interaction._interactive_objects) do
						if w:interaction().tweak_data == 'grenade_briefcase' then _briefcases = _briefcases + 1 end
					end
					if managers.assets:get_asset_unlocked_by_id( "grenade_crate" ) then _briefcases = _briefcases - 1 end
					
					--Check
					if _keycardsoncivs == 1 then
						if _keycardspawned == 0 then
							if _briefcases == 0 then
								if interact == 'open_slash_close_act' then
									hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_lootdrop', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
								end
							elseif interact == 'grenade_briefcase' then
								hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
							end
						elseif interact == 'pickup_keycard' then
							hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_bank_manager_key', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
						end
					end
					
					if interact == 'pickup_keycard' and v:position() ~= Vector3(250, 6750, -64.2354) then
						hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_bank_manager_key', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
					end
					
					if interact == 'stash_planks_pickup' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_planks', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
					elseif interact == 'pickup_boards' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_planks', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
					end
					
				--End GO Bank stuff

				----------------------------------------------------------------------------
				-- YOU CAN COMMENT THE LINES IF YOU DON'T WANT TO HAVE A SPECIFIC WAYPOINT
				-- USE NOTEPAD++ IF POSSIBLE
				----------------------------------------------------------------------------
				
				elseif job == 'framing_frame_1' then
					-- framing frame day 1 paintings
					if interact == 'hold_take_painting' and job ~= "kosugi" then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
					end
				end
													
				if interact == 'pickup_keycard' then
					if job == 'roberts' and v:position() == Vector3(250, 6750, -64.2354) then
					-- Nothing
					elseif job == 'big' and v:position() == Vector3(3000, -3500, 949.99) then
					-- Nothing
					elseif job == 'firestarter_2' and v:position() == Vector3(-1800, -3600, 400) then
					-- Nothing
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_bank_manager_key', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
					end
				end
				
				-- big bank keys
				if (interact == 'invisible_interaction_open' or interact == 'take_keys') and job == 'big' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_chavez_key', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
				end
				-- weapons
				if interact == 'weapon_case' or interact == 'take_weapons' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'ak', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.purple, blend_mode = "add" }  )
				-- coke
				elseif interact == 'gen_pku_cocaine' then
					if job == 'watchdogs_2' then
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_vial', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					end
				end
				-- crowbar
				if interact == 'gen_pku_crowbar' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_crowbar', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- planks
				elseif interact == 'stash_planks_pickup' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_planks', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				elseif interact == 'pickup_boards' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_planks', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				end
				-- shadow raid crates location
				if interact == 'crate_loot_crowbar' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_lootdrop', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- election day 2 crates location
				elseif interact == 'crate_loot' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_lootdrop', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
                -- Election Day Truck Locator
                if job == 'election_day_1' then
					if isHost() then
                        local trucks = 
                        {
							["100636"] = "1",
							["100633"] = "2",
							["100637"] = "3",
							["100634"] = "4",
							["100639"] = "5",
							["100635"] = "6"
                        }
                        local truckid = 
                        {
                            ["100633"] = "3b0947a2434bdc93",
                            ["100634"] = "3b0947a2434bdc93",
                            ["100635"] = "3b0947a2434bdc93",
							["100636"] = "3b0947a2434bdc93",
							["100637"] = "3b0947a2434bdc93",
							["100639"] = "3b0947a2434bdc93"
                        }
                        local truck_vectors = 
                        {
							["100636"] = Vector3(150, -3900, 0), -- 1st
							["100633"] = Vector3(878.392, -3360.24, 0), --2nd
							["100637"] = Vector3(149.999, -2775, 0), --3rd
							["100634"] = Vector3(828.07, -2222.45, 0), --4th
							["100639"] = Vector3(149.998, -1625, 0), --5th
							["100635"] = Vector3(848.961, -1084.9, 0) --6th
                        }
                        local truckv = tostring(managers.mission:script("default")._elements[100631]._values.on_executed[1].id)
					                                                
                        -- WAYPOINT SERVER
                        if _gps_used == false then
                            hud:add_waypoint( 'hudz_'..truckv, { icon = 'wp_target', distance = true, position = truck_vectors[truckv], no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
                        end
						if v:interaction() == 'key' then
							hud:add_waypoint( 'hudz_'..k, { icon = 'wp_powersupply', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
						end
					end
                end
				-- framing frame day 3 computer location
				if interact == 'use_computer' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'laptop_objective', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- framing frame day 3 phone location
				elseif interact == 'pickup_phone' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_phone', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- framing frame day 3 tablet location
				elseif interact == 'pickup_tablet' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_hack_ipad', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- framing frame day 3 servers location
				elseif (interact == 'hold_take_server' or interact == 'stash_server_pickup') and job == "framing_frame_3" then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_stash_server', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
				-- Framing Frame Day 3 server
				if job == 'framing_frame_3' then
					if isHost() then
						local servers = 
						{
							["105507"] = "Server Room 1",
							["105508"] = "Server Room 2",
							["100650"] = "Server Room 3"
						}
						local keyboard = 
						{
							["105507"] = "58cb6c4c6221c415",
							["105508"] = "58cb6c4c6221c415",
							["100650"] = "58cb6c4c6221c415"
						}
						local server_vectors = 
						{
							["105507"] = Vector3(-3937.26, 5644.73, 3474.5), -- Office
							["105508"] = Vector3(-3169.57, 4563.03, 3074.5), -- Hallway
							["100650"] = Vector3(-4920, 3737, 3074.5)	-- Living Room
						}
						local svectors = tostring(managers.mission:script("default")._elements[105506]._values.on_executed[1].id)
												
						-- WAYPOINT SERVER
						if _FF3_used == false then
							hud:add_waypoint( 'hudz_'..svectors, { icon = 'interaction_keyboard', distance = true, position = server_vectors[svectors], no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
						end					
					elseif isClient() and interact == 'key' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
					end
				end
			
				-- rats day 1
				if interact == 'caustic_soda' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_methlab', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				elseif interact == 'hydrogen_chloride' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_methlab', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				elseif interact == 'muriatic_acid' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_methlab', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
				end
				
				-- election day 1, computer location
				if interact == 'uload_database' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				-- election day 2, machines
				elseif interact == 'crate_loot_crowbar' and job == 'election_day_2' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				elseif interact == 'crate_loot_close' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_goto', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
				-- election day 3, keyboard
				if job == 'election_day_3_skip1' or job == 'election_day_3_skip2' or job == 'election_day_3' then
					if interact == 'security_station_keyboard' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_keyboard', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
					end	
				end
				-- Watchdogs Day 1
				if interact == 'drill' and v:position() == Vector3(1427.3450927734, -875.96325683594, 84.865676879883) then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_drill', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
								
				-- firestarter day 2 security boxes location
				if interact == 'open_slash_close_sec_box' and managers.groupai:state():whisper_mode() and job == 'firestarter_2' then
					if isHost() then
						bo_boxes = {
							["105819"] = Vector3(-2710, -2830, 552),-- Box 001
							["105794"] = Vector3(-1840, -3195, 552),-- Box 002
							["105810"] = Vector3(-1540, -2195, 552),-- Box 003
							["105824"] = Vector3(-1005, -3365, 552),-- Box 004
							["105837"] = Vector3(-635, -1705, 552),	-- Box 005
							["105851"] = Vector3(-1095, -210, 152),	-- Box 006
							["106183"] = Vector3(-1230, 1510, 152),	-- Box 007
							["106529"] = Vector3(-1415, -795, 152),	-- Box 008
							["106543"] = Vector3(-1160, 395, 152),	-- Box 009
							["106556"] = Vector3(-5, 735, 152),		-- Box 010
							["106581"] = Vector3(1360, 5, 552),		-- Box 011
							["106594"] = Vector3(795, -898, 552),	-- Box 012
							["106607"] = Vector3(795, -3240, 552),	-- Box 013
							["106620"] = Vector3(1060, -2195, 552),	-- Box 014
							["106633"] = Vector3(204, 540, 578),	-- Box 015
							["106646"] = Vector3(-1085, -1205, 552),-- Box 016
							["106659"] = Vector3(-2135, 395, 552),	-- Box 017
							["106672"] = Vector3(-2405, -840, 552),	-- Box 018
							["106685"] = Vector3(-2005, -1640, 552),-- Box 019
							["106698"] = Vector3(-2715, -1595, 552),-- Box 020
							["106711"] = Vector3(-500, -650, 1300),	-- Box 021
							["106724"] = Vector3(-400, -650, 1300),	-- Box 022
							["106737"] = Vector3(-300, -650, 1300),	-- Box 023
							["106750"] = Vector3(-200, -650, 1300),	-- Box 024
							["106763"] = Vector3(-100, -650, 1300),	-- Box 025
							["106776"] = Vector3(-635, -1205, 152),	-- Box 026
							["106789"] = Vector3(-1040, -95, 552),	-- Box 027
							["106802"] = Vector3(615, 395, 152),	-- Box 028
							["106815"] = Vector3(1890, -1805, 152),	-- Box 029
							["106828"] = Vector3(215, -1805, 152)	-- Box 030
						}
						
						SecBox1 = tostring(managers.mission:script("default")._elements[106836]._values.on_executed[1].id)
						SecBox2 = tostring(managers.mission:script("default")._elements[106836]._values.on_executed[2].id)

						if _box1_used == false then
							hud:add_waypoint( 'hudz_'..SecBox1, { icon = 'interaction_wirecutter', distance = true, position = bo_boxes[SecBox1], no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
						end
						if _box2_used == false then
							hud:add_waypoint( 'hudz_'..SecBox2, { icon = 'interaction_wirecutter', distance = true, position = bo_boxes[SecBox2], no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.blue, blend_mode = "add" }  )
						end
					elseif isClient() then
					end
				end
				if nb == 5 then nb = 0 end
				
				-- Big Oil day 1 intel
				if interact == 'hold_take_blueprints' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				elseif interact == 'take_confidential_folder' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				elseif interact == 'pickup_asset' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_chavez_key', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.yellow, blend_mode = "add" }  )
				end
				-- Safes
				if interact == 'drill' then
					-- Big Oil day 1 Safes
					if job == 'welcome_to_the_jungle_1' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_drill', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					-- Diamond Hesit Safes
					elseif job == 'family' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_drill', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					-- Four Stores Safes
					elseif job == 'four_stores' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_drill', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					-- Mallcrasher Safes
					elseif job == 'mallcrasher' then
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_drill', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					end
				end
				
				-- Big Oil day 2 engine + server
				if job == 'welcome_to_the_jungle_2' and interact == 'gen_pku_fusion_reactor' then
					if isHost() then
						local values = 
						{
							["103717"] = "Fusion Engine Revealer: Engine_12",
							["103716"] = "Fusion Engine Revealer: Engine_11",
							["103715"] = "Fusion Engine Revealer: Engine_10",
							["103714"] = "Fusion Engine Revealer: Engine_09",
							["103711"] = "Fusion Engine Revealer: Engine_08",
							["103709"] = "Fusion Engine Revealer: Engine_07",
							["103708"] = "Fusion Engine Revealer: Engine_06",
							["103707"] = "Fusion Engine Revealer: Engine_05",
							["103706"] = "Fusion Engine Revealer: Engine_04",
							["103705"] = "Fusion Engine Revealer: Engine_03",
							["103704"] = "Fusion Engine Revealer: Engine_02",
							["103703"] = "Fusion Engine Revealer: Engine_01"
						}
						local engine_id = 
						{
							['103703'] = 'f0e7a7f29fc87c44', --Engine 01
							['103704'] = 'db218f98a571c0b1', --Engine 02
							['103705'] = 'c717770fadc88e04', --Engine 03
							['103706'] = '5fb0a3191c4b8202', --Engine 04
							['103707'] = '0b2ecebcf49765b9', --Engine 05
							['103708'] = 'b531a6b7026ad84f', --Engine 06
							['103709'] = 'e191b6d86e655e23', --Engine 07
							['103711'] = '5aabe6e626f00bd4', --Engine 08
							['103714'] = '5afbe85d94046cbe', --Engine 09
							['103715'] = '9f316997306803b9', --Engine 10
							['103716'] = 'b2560b63edcda138', --Engine 11
							['103717'] = 'ee644ab092313077'  --Engine 12
						}
						local srooms = 
						{
							["101865"] = "Server Room Revealer: 1st floor, Back of the property",
							["101866"] = "Server Room Revealer: 1st floor, Front of the property",
							["101915"] = "Server Room Revealer: Ground floor"
						}
						local keyboard_id = 
						{
							["101865"] = "8efe34cd3f706348",
							["101866"] = "8efe34cd3f706348",
							["101915"] = "8efe34cd3f706348"
						}
						local bo_servers = 
						{
							["101865"] = Vector3(-662, -2142, 475),	-- Room 1
							["101866"] = Vector3(-2129, 391, 475), -- Room 2
							["101915"] = Vector3(-384, -96, 75) -- Room 3
						}
						local bo_keyboard = tostring(managers.mission:script("default")._elements[101916]._values.on_executed[1].id)			
						local correct_id = tostring(managers.mission:script('default')._elements[103718]._values.on_executed[1].id)
												
						-- WAYPOINT SERVER
						if _keyboard_used == false then
							hud:add_waypoint( 'hudz_'..bo_keyboard, { icon = 'interaction_keyboard', distance = true, position = bo_servers[bo_keyboard], no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
						end
							
						-- WAYPOINT	ENGINE
						if v:name():key() == engine_id[correct_id] then
							hud:add_waypoint( 'hudz_'..correct_id, { icon = 'pd2_loot', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = 'present', radius = 800, color = Color.green, blend_mode = 'add' }  )
						end						
					else
					end
				end
				
				-- shadow raid server
				if (interact == 'hold_take_server' or interact == 'stash_server_pickup') and job == "kosugi" then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_stash_server', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
				-- shadow raid paintings
				elseif interact == 'hold_take_painting' and job == "kosugi" then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
				-- shadow raid statue inside crate
				elseif interact == 'gen_pku_artifact_statue' or interact == 'samurai_armor' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'wp_scrubs', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
				end
				
				--Train Heist
				if interact == 'disassemble_turret' and job == "arm_for" then
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_sentry', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
				end
				
				if job == "arm_for" then
					if isHost() then
						local vault1 = tostring(managers.mission:script("default")._elements[104736]._values.on_executed[1].id)
						local vault2 = tostring(managers.mission:script("default")._elements[104737]._values.on_executed[1].id)
						local vault3 = tostring(managers.mission:script("default")._elements[104738]._values.on_executed[1].id)
						
						if _drill1_used == false then
							if vault1 == '104731' then
								hud:add_waypoint( 'hudz_'..vault1, { icon = 'wp_target', distance = true, position = Vector3(-2710, -1152, 666), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
							elseif vault1 == '104729' then
								hud:add_waypoint( 'hudz_'..vault1, { icon = 'wp_target', distance = true, position = Vector3(-1707, -1157, 667), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
							end
						end
						
						if _drill2_used == false then
							if vault2 == '104732' then
								hud:add_waypoint( 'hudz_'..vault2, { icon = 'wp_target', distance = true, position = Vector3(-192, -1152, 668), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
							elseif vault2 == '104733' then
								hud:add_waypoint( 'hudz_'..vault2, { icon = 'wp_target', distance = true, position = Vector3(794, -1161, 668), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
							end
						end
						
						if _drill3_used == false then
							if vault3 == '104734' then
								hud:add_waypoint( 'hudz_'..vault3, { icon = 'wp_target', distance = true, position = Vector3(2291, -1155, 667), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
							elseif vault3 == '104735' then
								hud:add_waypoint( 'hudz_'..vault3, { icon = 'wp_target', distance = true, position = Vector3(3308, -1151, 667), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
							end
						end
					end
				end
		
				-- Ukrainian Job  Power
				if interact == 'circuit_breaker' and job == "ukrainian_job" then
					hud:add_waypoint( 'hudz_'..k, { icon = 'wp_powersupply', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
				end
				
				-- Ukrainian Job Tiara location
				if job == "ukrainian_job" and _tiara_used == false then
					if isHost() then
						local unit_list = World:find_units_quick( "all" ) 
						for _,unit in ipairs( unit_list ) do 
							if unit:base() and tostring(unit:name()) == "Idstring(@ID077636ce1f33c8d0@)" --[[TIARA]] then
								hud:add_waypoint( 'hudz_'.._, { icon = 'pd2_loot', distance = true, position = unit:position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
							end
						end
					elseif isClient() then
						local unit_list = World:find_units_quick( "all" ) 
						for _,unit in ipairs( unit_list ) do 
							if unit:base() and tostring(unit:name()) == "Idstring(@ID077636ce1f33c8d0@)" --[[TIARA]] then
								hud:add_waypoint( 'hudz_'.._, { icon = 'pd2_loot', distance = true, position = unit:position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
							end
						end
					end
				end
				
				-- Firestarter day 2 evidence locker
				if interact == 'drill' and v:position() == Vector3(197.65490722656, -481.03671264648, 85.349334716797) then
					hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_loot', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
								
				--DIAMOND STORE KEYPAD
				if job == "family" and interact == 'numpad_keycard' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'wp_powerbutton', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
				end
				
				-- Security Doors
				if interact == 'key' then
					if job == "firestarter_3" and v:position() == Vector3(-1600.6843261719, 2129.4165039063, 502.40942382813) then
						hud:add_waypoint( 'hudz_'..k, { icon = 'wp_powersupply', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
					elseif job == 'big' then
						if v:position() == Vector3(398.31564331055, -1295.5836181641, -497.59356689453) or v:position() == Vector3(1448.5836181641, -1901.6843261719, -897.59057617188) or v:position() == Vector3(704.41644287109, 1100.6843261719, -897.59057617188) then
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_keyboard', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
						end
					elseif job == 'firestarter_2' then
						if v:position() == Vector3(-2826.3156738281, 370.58358764648, 502.40942382813) or v:position() == Vector3(1370.8236083984, -2625.1843261719, 99.073379516602) or v:position() == Vector3(-2329.1765136719, -3625.1843261719, 499.07342529297) or v:position() == Vector3(1225.1843261719, -2929.1765136719, 499.07342529297) then
							hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_stash_server', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
						end
					elseif job == 'welcome_to_the_jungle_2' then
						if isHost() then
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
						end
					elseif job == 'framing_frame_3' or job == 'election_day_1' or job == 'nightclub' or job == 'arm_for' then
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'pd2_computer', distance = true, position = v:interaction():interact_position(), no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
					end
				end
				
				-- money
				if interact == 'money_wrap_single_bundle' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				elseif interact == 'cash_register' then
					if job == "jewelry_store" or job == "ukrainian_job" then
						if v:position() == Vector3(1844, 665, 117.732) then
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
						end 
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
					end
				elseif interact == 'money_small' then
					hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				elseif interact == 'money_wrap' then
					if job == 'election_day_3_skip1' then
					elseif job == "arm_for" then
						if v:position() == Vector3(71, -1299, -2375.39)
							or v:position() == Vector3(471, -1233, -2375.39)
							or v:position() == Vector3(471, -1299, -2375.39)
							or v:position() == Vector3(371, -1299, -2375.39)
							or v:position() == Vector3(271, -1299, -2375.39)
							or v:position() == Vector3(271, -1233, -2375.39)
							or v:position() == Vector3(171, -1299, -2375.39)
							or v:position() == Vector3(171, -1233, -2375.39)
							or v:position() == Vector3(71, -1233, -2375.39)
							or v:position() == Vector3(371, -1233, -2375.39)
							
							or v:position() == Vector3(-2400, -1300, -2375.39)
							or v:position() == Vector3(-2400, -1200, -2375.39)
							or v:position() == Vector3(-2300, -1200, -2375.39)
							or v:position() == Vector3(-2200, -1200, -2375.39)
							or v:position() == Vector3(-2300, -1300, -2375.39)
							or v:position() == Vector3(-2100, -1200, -2375.39)
							or v:position() == Vector3(-2200, -1300, -2375.39)
							or v:position() == Vector3(-2000, -1200, -2375.39)
							or v:position() == Vector3(-2000, -1300, -2375.39)
							or v:position() == Vector3(-2100, -1300, -2375.39)
							
							or v:position() == Vector3(2555, -1275, -2375.39)
							or v:position() == Vector3(2550, -1200, -2375.39)
							or v:position() == Vector3(2655, -1275, -2375.39)
							or v:position() == Vector3(2650, -1200, -2375.39)
							or v:position() == Vector3(2755, -1275, -2375.39)
							or v:position() == Vector3(2750, -1200, -2375.39)
							or v:position() == Vector3(2855, -1275, -2375.39)
							or v:position() == Vector3(2850, -1200, -2375.39)
							or v:position() == Vector3(2955, -1275, -2375.39)
							or v:position() == Vector3(2950, -1200, -2375.39)
						then
							--
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
						end
					elseif job == "welcome_to_the_jungle_1" then
						if v:position() == Vector3(9200, -4300, 100) then
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
						end
					elseif job == "family" then
						if v:position() == Vector3(1400, 200, 1100) then
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
						end
					elseif job == 'big' then
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_money_wrap', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.orange, blend_mode = "add" }  )
					end
					
				-- gold
				elseif interact == 'gold_pile' then
					if job == "welcome_to_the_jungle_1" then
						if v:position() == Vector3(9200, -4400, 100) then
						else
							hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_gold', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
						end
					elseif job == 'big' then
					else
						hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_gold', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.red, blend_mode = "add" }  )
					end
				
				-- diamonds/jewels
				elseif interact == 'diamond_pickup' or interact == 'gen_pku_jewelry' then
					if job == "ukrainian_job" and v:position().z > 0 then
						hud:add_waypoint( 'hudz_'..k, { icon = 'interaction_diamond', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.green, blend_mode = "add" }  )
					end
				-- ATMS
				elseif interact == 'requires_ecm_jammer_atm' then 
					hud:add_waypoint( 'hudz_'..k, { icon = 'equipment_ecm_jammer', distance = true, position = pos, no_sync = true, present_timer = 0, state = "present", radius = 800, color = Color.white, blend_mode = "add" }  )
				end
			end
		end
	end
	
	-- initialize waypoints
	RefreshItemWaypoints()

	--when a package is removed from the game, also refresh waypoints
	managers.interaction._remove_object = managers.interaction._remove_object or managers.interaction.remove_object
	function ObjectInteractionManager:remove_object( obj )
		local interacted = obj:interaction().tweak_data
		local result = self:_remove_object(obj)
		local position = obj:position()
		local position2 = obj:interaction():interact_position()
		
		
		if interacted == 'gage_assignment' 
		or interacted == 'pickup_keycard' 
		or interacted == 'invisible_interaction_open'
		or (job == 'big' and (interacted == 'invisible_interaction_open' or interacted == 'take_keys' ))
		or (job == 'family' and interacted == 'numpad_keycard')
		or interacted == 'key'
		or (job == 'roberts' and (interacted == 'open_slash_close_act' or interacted == 'grenade_briefcase'))
		or interacted == 'weapon_case' or interacted == 'take_weapons' or interacted == 'gen_pku_cocaine'
		or interacted == 'stash_planks_pickup' or interacted == 'pickup_boards'
		or interacted == 'crate_loot' or interacted == 'crate_loot_crowbar' or interacted == 'crate_loot_close' or interacted == 'gen_pku_crowbar' or interacted == 'votingmachine2'
		or interacted == 'hold_take_server' or interacted == 'stash_server_pickup' or interacted == 'hold_take_painting' 
		or interacted == 'big_computer_hackable' or interacted == 'uload_database' or interacted == 'gen_pku_artifact_statue' 
		or interacted == 'use_computer' or interacted == 'pickup_phone'	or interacted == 'pickup_tablet' 
		or interacted == 'big_computer_server' or interacted == 'sewer_manhole' or interacted == 'pickup_asset' or interacted == 'disassemble_turret'
		or interacted == 'circuit_breaker' or interacted == 'apply_thermite_paste' 
		or (job == 'alex_1' and (interacted == 'caustic_soda' or interacted == 'hydrogen_chloride' or interacted == 'muriatic_acid'))
		or (job == 'alex_2' and (interacted == 'take_confidential_folder' or interacted == 'drill'))
		or (job == 'welcome_to_the_jungle_1' and (interacted == 'drill'))
		then
			RefreshItemWaypoints()
		end 
		
		-- MONEY
		if interacted == 'gen_pku_jewelry' or interacted == 'money_wrap' or interacted == 'diamond_pickup' 
		or interacted == 'money_small' or interacted == 'money_wrap_single_bundle' or interacted == 'cash_register' 
		or interacted == 'gold_pile' or interacted == 'requires_ecm_jammer_atm' 
		then
			RefreshItemWaypoints()
		end 
		-- BIG OIL 2
		if (job == 'welcome_to_the_jungle_2' and interacted == 'security_station_keyboard') then
			_keyboard_used = true
			RefreshItemWaypoints()
		end
		if (job == 'welcome_to_the_jungle_2' and interacted == 'gen_pku_fusion_reactor') then
			_engine_used = true
			RefreshItemWaypoints()
		end
		if (job == 'election_day_1' and interacted == 'hold_place_gps_tracker') then
			_gps_used = true
			RefreshItemWaypoints()
		end
		-- Framing Frame 3
		if (job == 'framing_frame_3' and interacted == 'security_station_keyboard') then
			_FF3_used = true
			RefreshItemWaypoints()
		end
		-- Nightclub safes
		if (job == 'nightclub' and interacted == 'drill') then
			RefreshItemWaypoints()
		end
		-- Big Bank
		if (job == 'big' and interacted == 'security_station_keyboard') then
			RefreshItemWaypoints()
		end
		-- RATS 2
		if (job == 'alex_2' and interacted == 'take_confidential_folder') then
			_intel_used = true
			RefreshItemWaypoints()
		end
		-- TIARA
		if (job == 'ukrainian_job' and interacted == 'tiara_pickup') then
			_tiara_used = true
			RefreshItemWaypoints()
		end
		-- TRAIN HEIST
		if (job == 'arm_for' and interacted == 'lance') then
			if position == Vector3(-1750, -1200, 685) or position == Vector3(-2650, -1100, 685) then
			_drill1_used = true -- GREEN
			
			elseif position == Vector3(-150, -1100, 685) or position == Vector3(750, -1200, 685) then
			_drill2_used = true -- ORANGE
			
			elseif position == Vector3(3250, -1200, 685) or position == Vector3(2350, -1100, 685) then
			_drill3_used = true -- RED

			end
			RefreshItemWaypoints()
		end
		-- FIRESTARTER 2
		if (job == 'firestarter_2') then
			if isHost() then
				if interacted == 'hospital_security_cable' then
					tabclk[1] = os.clock()
				elseif interacted == 'open_slash_close_sec_box' then
					tabclk[2] = os.clock()
				end

				if (tabclk[1] ~= nil and tabclk[2] ~= nil) or (tabclk[1] == nil and tabclk[2] ~= nil) then
					if tabclk[1] == nil then tabclk[1] = 0 end -- to prevent a nil value if you want to cut the first cable
					local test = tabclk[2] - tabclk[1]
					
					if test < 0.5 and test > 0 or test < 0 and test > -0.5 then
						-- CLOSING THE BOX
					else
						-- CUTTING THE CABLE OR OPENING THE BOX
						if interacted == 'hospital_security_cable' 
							and position == bo_boxes[SecBox1] 
								then 
									_box1_used = true
									RefreshItemWaypoints()
						elseif interacted == 'hospital_security_cable' 
							and position == bo_boxes[SecBox2] 
								then
									_box2_used = true
									RefreshItemWaypoints()
						end
					end
				end
				if not managers.groupai:state():whisper_mode() then
					_box1_used = true
					_box2_used = true
					RefreshItemWaypoints()
				end
			elseif isClient() then
				if not managers.groupai:state():whisper_mode() then
					_box1_used = true
					_box2_used = true
					RefreshItemWaypoints()
				end
				if interacted == 'hospital_security_cable' then
					local vecX = position2.x
					local vecY = position2.y
					-- local vecZ = position2.z
					
					for k, v in pairs(clientBox) do
						if clientBox[k] ~= 0 then
							if 
								(vecX < clientBox[k].x + 50 and vecX > clientBox[k].x - 50)
							and
								(vecY < clientBox[k].y + 50 and vecY > clientBox[k].y - 50)
							then
								clientBox[k] = 0
								clientSucceed = clientSucceed + 1
								RefreshItemWaypoints()
							end
						end
						if clientSucceed == 2 then
							clientBox[1] = 0
							clientBox[2] = 0
							clientBox[3] = 0
							clientBox[4] = 0
							clientBox[5] = 0
							RefreshItemWaypoints()
						end
					end
				end
			end
		end
		
		--[[DEBUG
		local file = io.open("VectorDump.txt", "a+")
		file:write(tostring(obj))
		file:write("\n")
		file:write("Interaction Name: ")
		file:write(tostring(obj:interaction().tweak_data))
		file:write("\n")
		file:write("Location: ")
		file:write("\n")
		file:write("Vector3(")
		file:write(tostring(obj:position().x))
		file:write(", ")
		file:write(tostring(obj:position().y))
		file:write(", ")
		file:write(tostring(obj:position().z))
		file:write(")")
		file:write("\n")
		file:write("Object ID: ")
		file:write(tostring(obj:name()))
		file:write("\n\n")
		file:close()
		--END]]
		
		return result
	end

	--if map is GO bank and keycard or briefcase are spawned, also refresh waypoints
	managers.interaction._add_object = managers.interaction._add_object or managers.interaction.add_object
	function ObjectInteractionManager:add_object( obj )
		local spawned = obj:interaction().tweak_data
		local result = self:_add_object(obj)
		if job == 'roberts' and (spawned == 'pickup_keycard' or spawned == 'grenade_briefcase') then
			RefreshItemWaypoints()
		elseif (spawned == 'pickup_keycard' or spawned == 'grenade_briefcase') then
			RefreshItemWaypoints()
		end
		return result
	end
end