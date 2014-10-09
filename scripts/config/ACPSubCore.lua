if not ACPSubCore then
    ACPSubCore = true
    dofiles("scripts/startup/global.lua")
    dofiles("scripts/startup/StartupScripts.lua")
    dofiles("scripts/startup/Anti Anti-Cheat.lua")
    dofiles("scripts/startup/ClassicStealth.lua")
    dofiles("scripts/startup/RebalanceAI.lua")
    dofiles("scripts/startup/PauseRemover.lua")
	dofiles("scripts/startup/CustomMenuClass.lua")
	dofiles("scripts/startup/CustomMenuUtilities.lua")
	dofiles("scripts/config/DCglobals.lua")
	dofiles("scripts/startup/post require/interactthruwalls.lua")
	if tweak_data and tweak_data.ACPConfig.PocoHUD_Enable then
		dofiles("poco/common.lua")
		dofiles("poco/Hud3.lua")
	end
	-- Below are weapon rebalancing scripts
    dofiles("scripts/startup/rebalance.lua")
    dofiles("scripts/startup/rebalance_attach.lua")
    dofiles("scripts/startup/shotgat_physics.lua")
    dofiles("scripts/startup/realnames.lua")
    dofiles("scripts/startup/rebalance_general.lua")
end