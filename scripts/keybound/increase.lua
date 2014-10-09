if isHost() then
	if Global.game_settings.reputation_permission < 100 and managers.experience:current_level() >= (Global.game_settings.reputation_permission + 10) then
		Global.game_settings.reputation_permission = Global.game_settings.reputation_permission + 10
	end
	managers.chat:feed_system_message(ChatManager.GAME, "Lobby Level requirement set to " .. Global.game_settings.reputation_permission )
	MenuCallbackHandler:update_matchmake_attributes()
end