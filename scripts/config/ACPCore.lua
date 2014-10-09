if RequiredScript then
	local ACP_base_path = "scripts/startup/post require/"
	local ACPPostRequiredScript = RequiredScript:lower()
    local ACPPostRequires = 
	{
		["lib/managers/group_ai_states/groupaistatebase"] = "crashfix.lua",
		["lib/managers/gameplaycentralmanager"] = "crashfix.lua", 
		["lib/units/enemies/cop/actions/lower_body/copactionwalk"] = "crashfix.lua", 
		["lib/units/enemies/spooc/actions/lower_body/actionspooc"] = "crashfix.lua", 
		["lib/managers/weaponfactorymanager"] = "postrequire_attach.lua", 
		["lib/managers/preplanningmanager"] = "increasedfavors.lua", 
		["lib/managers/objectinteractionmanager"] = "interactthruwalls.lua", 
		["lib/units/enemies/cop/copbrain"] = "pagerchance.lua", 
		["lib/units/enemies/cop/copsound"] = "cloaker.lua", 
		["lib/states/missionendstate"] = "endscreen.lua", 
		["lib/units/weapons/NewRaycastWeaponBase"] = "persistentgadget.lua", 
		["lib/managers/menu/newsfeedgui"] = "newsfeedfix.lua", 
		["lib/managers/menumanager"] = "menumanager.lua",
		["lib/units/civilians/civilianbrain"] = "hostages.lua", 
		["lib/managers/playermanager"] = "playermanager.lua", 
		["lib/units/interactions/interactionext"] = "interactionext.lua", 
		["lib/units/beings/player/states/playerstandard"] = "playerstandard.lua", 
		["lib/managers/moneymanager"] = "moneymanager.lua", 
		["lib/managers/menumanager"] = "menumanager.lua", 
		["lib/units/enemies/cop/copdamage"] = "copdamage.lua", 
		["lib/managers/dialogmanager"] = "dialogmanager.lua", 
		["lib/managers/objectivesmanager"] = "objectivesmanager.lua",
		["lib/managers/hudmanagerpd2"] = {"blackscreen.lua", "Customizable_Crosshair.lua"},
		["lib/units/beings/player/playermovement"] = "Customizable_Crosshair_Plugin.lua",
		["lib/managers/raycastweaponbase"] = "raycastweaponbase.lua",
		["lib/network/matchmaking/NetworkAccountSTEAM"] = "steampublish.lua",
		["lib/units/weapons/weaponlaser"] = "weaponlaser.lua"
	}
	
	if not _G.clone_methods then
		function _G.clone_methods(ThisClass)
			if not ThisClass.oldMethods then 
				ThisClass.oldMethods = clone(ThisClass) 
			end
		end
	end
	
	if tweak_data and not tweak_data.ACPconfig then
		dofile("scripts/config/ACPConfig.lua")
		tweak_data.ACPConfig = ACPConfig:new()
	end
	if ACPPostRequires[ACPPostRequiredScript] then				
		if type(ACPPostRequires[ACPPostRequiredScript]) == "table" then
			for k,v in pairs(ACPPostRequires[ACPPostRequiredScript]) do
				dofile(ACP_base_path .. v)
			end
		elseif type(ACPPostRequires[ACPPostRequiredScript]) == "string" then
			dofile(ACP_base_path .. ACPPostRequires[ACPPostRequiredScript])
		end
	end
end