-- KILL EM ALL
if tweak_data and tweak_data.ACPConfig then
	if inGame() and isPlaying() and not inChat() then
		if isHost() then
			local function destroy_unit(unit)
				if unit:character_damage():pickup() and unit:character_damage():pickup()  ~= "ammo" then
					unit:character_damage():drop_pickup()
				end
				World:delete_unit(unit)
			end
			deleteall = deleteall or function()
				for u_key, u_data in pairs(managers.enemy:all_enemies()) do
					destroy_unit(u_data.unit)
				end

				if tweak_data.ACPConfig.KA_Kills_Civilians then
					for u_key, u_data in pairs(managers.enemy:all_civilians()) do
						if not isHostage(u_data.unit)then
							destroy_unit(u_data.unit)
						end
					end
				end
				
				if tweak_data.ACPConfig.KA_Disables_Cameras then
					for _, cam_unit in ipairs(SecurityCamera.cameras) do
						if cam_unit:enabled() then
							cam_unit:base():set_detection_enabled(false)
						end	
					end	
				end
			end
			deleteall()
			managers.hud:show_hint( { text = "Geezbola unleashed!" } )
		else
			managers.hud:show_hint( { text = "Temporarily Host-Only" } )
			--[[if tweak_data.ACPConfig.KA_Client then
				function nukeunit(pawn)
					local col_ray = { }
					col_ray.ray = Vector3(1, 0, 0)
					col_ray.position = pawn.unit:position()
					local action_data = {}
					action_data.variant = "explosion"
					action_data.damage = 1000
					action_data.attacker_unit = managers.player:player_unit()
					action_data.col_ray = col_ray
					pawn.unit:character_damage():damage_explosion(action_data)
				end
				killall = killall or function()
					if tweak_data.ACPConfig.KA_Kills_Civilians then
						for u_key,u_data in pairs(managers.enemy:all_civilians()) do
							if not isHostage(u_data)then
								nukeunit(u_data)
							end
						end
					end
					for u_key,u_data in pairs(managers.enemy:all_enemies()) do
						u_data.char_tweak.has_alarm_pager = nil
						nukeunit(u_data)        
					end 
				end
				killall()
				managers.hud:show_hint( { text = "Geezbola unleashed!" } )
			end]]
		end
	end
end