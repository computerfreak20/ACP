if tweak_data and tweak_data.ACPConfig then
	local function expect_yes(self, params) params.yes_func() end

	if tweak_data.ACPConfig.No_Skill_Confirmation then
		MenuManager.show_confirm_skillpoints = expect_yes
		MenuManager.show_confirm_respec_skilltree = expect_yes
	end
	
	function MenuCallbackHandler.singleplayer_restart() 
		return true 
	end
end