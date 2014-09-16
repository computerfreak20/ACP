if tweak_data and tweak_data.ACPConfig then
	local ingredient_dialog = {}
	ingredient_dialog["pln_rt1_20"] = "Muriatic Acid"
	ingredient_dialog["pln_rt1_22"] = "Caustic Soda"
	ingredient_dialog["pln_rt1_24"] = "Hydrochloric Acid"
	ingredient_dialog["pln_rat_stage1_20"] = "Muriatic Acid"
	ingredient_dialog["pln_rat_stage1_22"] = "Caustic Soda"
	ingredient_dialog["pln_rat_stage1_24"] = "Hydrochloric Acid"

	local _queue_dialog_orig = DialogManager.queue_dialog
	if tweak_data.ACPConfig.Rats_Ingredients then
		function DialogManager:queue_dialog(id, ...)
			if ingredient_dialog[id] then
				if tweak_data.ACPConfig.Rats_Ingredient_Broadcast then
					managers.chat:send_message(ChatManager.GAME, managers.network.account:username() or "Offline", ingredient_dialog[id])
				else
					managers.chat:feed_system_message(ChatManager.GAME, "Add: " .. ingredient_dialog[id])
				end
			end
			return _queue_dialog_orig(self, id, ...)
		end
	end
end