if tweak_data and tweak_data.ACPConfig then
	-- ANTI ANTI-CHEATS v0.4
	-- CHECKS
	if not PlayerManager then return end

	-- GAME INTERNAL ANTI ANTI-CHEAT
	if not PlayerManager then return end
	function PlayerManager.verify_carry(_ARG_0_, _ARG_1_, _ARG_2_)
		return true
	end
	function PlayerManager:verify_equipment( peer_id, equipment_id )
		return true
	end
	function PlayerManager:verify_grenade( peer_id )
		return true
	end
	if not NetworkMember then return end
	function NetworkMember.place_deployable(_ARG_0_, _ARG_1_)
		return true
	end
	function NetworkMember.place_bag(_ARG_0_, _ARG_1_, _ARG_2_)
		return true
	end
	function NetworkMember.set_grenade(_ARG_0_, _ARG_1_)
		return true
	end

	--ANTI-HOXHUD ANTICHEAT
	if HoxHudTweakData and UnitNetworkHandler then
		function UnitNetworkHandler.check_loot_cheater(_ARG_0_, _ARG_1_, _ARG_2_) end
		function UnitNetworkHandler.set_carry_blacklisted(_ARG_0_, _ARG_1_, _ARG_2_) end
		function UnitNetworkHandler.is_carry_blacklisted(_ARG_0_, _ARG_1_) return false end
		function UnitNetworkHandler.server_drop_carry(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, ...)
			return _ARG_0_.oldMethods.server_drop_carry(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, ...)
		end
		function UnitNetworkHandler.sync_remove_carry(_ARG_0_, ...)
			return _ARG_0_.oldMethods.sync_remove_carry(_ARG_0_, ...)
		end
		function UnitNetworkHandler.sync_carry(_ARG_0_, ...)
			return _ARG_0_.oldMethods.sync_carry(_ARG_0_, ...)
		end
		function UnitNetworkHandler.sync_interacted(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, ...)
			if _ARG_3_ == "corpse_alarm_pager" then
				managers.hud:set_control_info({pager_answered = true})
			end
			_ARG_0_.oldMethods.sync_interacted(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, ...)
		end
		function UnitNetworkHandler.sync_grenades(_ARG_0_, ...)
			_ARG_0_.oldMethods.sync_grenades(_ARG_0_, ...)
		end
		--[[function UnitNetworkHandler.server_throw_grenade(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, ...)
			_ARG_0_.oldMethods.server_throw_grenade(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, ...)
		end]]--
		function UnitNetworkHandler.place_deployable_bag(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, ...)
			_ARG_0_.oldMethods.place_deployable_bag(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, ...)
		end
		function UnitNetworkHandler.place_sentry_gun(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, ...)
			_ARG_0_.oldMethods.place_sentry_gun(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, ...)
		end
		function UnitNetworkHandler.attach_device(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, ...)
			_ARG_0_.oldMethods.attach_device(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, ...)
		end
		function UnitNetworkHandler.request_place_ecm_jammer(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, ...)
			_ARG_0_.oldMethods.request_place_ecm_jammer(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, ...)
		end	
	end

	--[[REMOVE CHATSPAM
	if not ChatManager then return end
	ChatManager_feed_system_message = ChatManager_feed_system_message or ChatManager.feed_system_message
	function ChatManager:feed_system_message( channel_id, message )
		local _gmatch = {
			managers.localization:text( "menu_chat_peer_cheated_many_assets", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_wrong_equipment_server", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_wrong_equipment", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_equipments_server", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_equipments", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_bags_server", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_bags", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_bags_pickup_server", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_bags_pickup", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_grenades_server", { name = ".*" } ),
			managers.localization:text( "menu_chat_peer_cheated_many_grenades", { name = ".*" } )
		}
		for k,v in pairs(_gmatch) do
			if message:gmatch(v) then return end
		end
		ChatManager_feed_system_message( channel_id, message)
	end]]

	-- ANTI-PAYOUT CAP
	if not LootManager.get_secured_bonus_bags_value then return end
	LootManager_get_secured_bonus_bags_value = LootManager_get_secured_bonus_bags_value or LootManager.get_secured_bonus_bags_value
	function LootManager:get_secured_bonus_bags_value( level_id )
		local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
		
		local value = 0
		for _,data in ipairs( self._global.secured ) do
			if not tweak_data.carry.small_loot[ data.carry_id ] then
				if mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
					mandatory_bags_amount = mandatory_bags_amount - 1
				end
				value = value + managers.money:get_bag_value( data.carry_id, data.multiplier )
			end
		end
		
		return value
	end
	end