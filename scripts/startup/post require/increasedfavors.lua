if tweak_data and tweak_data.ACPConfig then
	-- Increased favors in Big Bank
	if not PrePlanningOriginalFunction then PrePlanningOriginalFunction = PrePlanningManager.get_current_budget end
	function PrePlanningManager:get_current_budget()
		return PrePlanningOriginalFunction(self), tweak_data.ACPConfig.Number_of_Favors
	end 

	-- REMOVE MAX PREPLAN ITEMS
	function PrePlanningManager:is_type_disabled( type ) return false end

	-- UNLIMITED CRAYONS
	tweak_data.preplanning.gui.MAX_DRAW_POINTS = 100000000000000

	-- HOST CHECK
	function isHost()
		if not Network then return false end
		return not Network:is_client()
	end

	-- Host has final say in Preplanning
	if tweak_data.ACPConfig.Host_Has_Final_Say then
		if isHost() then
			function PrePlanningManager:_update_majority_votes(...)
				if Network:is_client() then
					return self:__update_majority_votes(...)
				end
				local local_peer_id = managers.network:session():local_peer():id()
				local vote_council = self:get_vote_council()
				local winners = {}
				local plan_data = vote_council[local_peer_id]
				for plan,data in pairs( plan_data ) do
				winners[plan] = { data[1], data[2] }
				end
				self._saved_majority_votes = winners
				return self._saved_majority_votes
			end
		end
	end
end