--SPAWN BAG FUNCTION
if tweak_data and tweak_data.ACPConfig.Exploding_Bags then
	if inGame() and isPlaying() and isHost() and not inChat() then
		function ServerSpawnBag(name, zipline_unit)
			if not alive (managers.player:player_unit()) then return end
			local camera_ext = managers.player:player_unit():camera()
			local carry_data = tweak_data.carry[ name ]
			local dye_initiated = carry_data.dye_initiated
			local has_dye_pack = carry_data.has_dye_pack
			local dye_value_multiplier = carry_data.dye_value_multiplier
			if Network:is_client() then
				managers.network:session():send_to_host("server_drop_carry", name, carry_data.multiplier, carry_data.dye_initiated, carry_data.has_dye_pack, carry_data.dye_value_multiplier, camera_ext:position(), camera_ext:rotation(), camera_ext:forward(), Vector3(0, 0, 0), zipline_unit)
			else
				managers.player:server_drop_carry(name, carry_data.multiplier, carry_data.dye_initiated, carry_data.has_dye_pack, carry_data.dye_value_multiplier, camera_ext:position(), camera_ext:rotation(), camera_ext:forward(), Vector3(0, 0, 0), zipline_unit, managers.network:session():local_peer():id())
			end
		end
		--BAG NAME
		spnturret = spnturret or function()
			ServerSpawnBag("person")
		end
		spnturret()

		local car_arr = { 'being' }
				for i, name in ipairs(car_arr) do
						if not tweak_data.carry.types["__" .. name] then
								tweak_data.carry.types["__" .. name] = clone(tweak_data.carry.types[name])
				end
						tweak_data.carry.types.being.throw_distance_multiplier = 1.2
						tweak_data.carry.types.being.move_speed_modifier = 1
						tweak_data.carry.types.being.jump_modifier = 1
						tweak_data.carry.types.being.can_run = true
						tweak_data.carry.types.being.can_explode = true
				end
	end
end