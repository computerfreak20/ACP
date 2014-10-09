if isHost() then
	if Global.game_settings.drop_in_allowed == true then
		Global.game_settings.drop_in_allowed = false
		managers.chat:feed_system_message(ChatManager.GAME, "Drop-In disabled")
	elseif Global.game_settings.drop_in_allowed == false then
		managers.chat:feed_system_message(ChatManager.GAME, "Drop-In enabled")
		Global.game_settings.drop_in_allowed = true
	end
	MenuCallbackHandler:update_matchmake_attributes()
end