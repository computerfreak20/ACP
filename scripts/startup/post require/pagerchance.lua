-- Pager has a chance of not having to be answered, with the chance decreasing with the amount of killed guards
-- Alerted guards will ALWAYS have pager
if tweak_data and tweak_data.ACPConfig.Pager_Chance then
	if not _CopBrain_clbk_alarm_pager then _CopBrain_clbk_alarm_pager = CopBrain.clbk_alarm_pager end
	function CopBrain:clbk_alarm_pager( ignore_this, data )
		local rand = math.rand(1)
			local chance_table = { 0.5, 0.25, 0.125, 0 }
			self._cTableIndex = (self._cTableIndex or 0) + 1
			local chance = self._unit:movement():cool() and chance_table[self._cTableIndex] or 0
			self._cTableIndex = math.clamp(self._cTableIndex, 1, #chance_table)
		
		if self._alarm_pager_data.nr_calls_made == 0 and rand < chance or managers.groupai:state():is_ecm_jammer_active("call") then
			self:end_alarm_pager()
			self:_chk_enable_bodybag_interaction()
			return
		end
		
		_CopBrain_clbk_alarm_pager(self, ignore_this, data )
	end
end