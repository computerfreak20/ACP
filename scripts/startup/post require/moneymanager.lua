if tweak_data and tweak_data.ACPConfig then
	-- Free Preplanning Favors
	if tweak_data.ACPConfig.Preplanning_is_Free then
		function MoneyManager:get_preplanning_type_cost(type) return 0 end
	end

	-- No cash penalty for killing civillians
	if tweak_data.ACPConfig.No_Cleaner_Cost then
		function MoneyManager.get_civilian_deduction() return 0 end
		function MoneyManager.civilian_killed() return end
	end

	--No cost to respec
	if tweak_data.ACPConfig.No_Cost_Respec then
		function MoneyManager:on_skillpoint_spent(tree, tier, points) return end
		function MoneyManager:on_respec_skilltree(tree, forced_respec_multiplier) return end
		function MoneyManager:can_afford_spend_skillpoint(tree, tier, points) return true end
	end
end