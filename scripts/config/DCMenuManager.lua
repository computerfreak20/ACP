function MenuCallbackHandler:pocohudToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("pocohud_id")
end
function MenuCallbackHandler:infinitestaminaToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("infinitestamina_id")
end
function MenuCallbackHandler:flashbangsToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("flashbangs_id")
end
function MenuCallbackHandler:joinpauseToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("joinpause_id")
end
function MenuCallbackHandler:grenaderefillToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("grenaderefill_id")
end
function MenuCallbackHandler:infinitesawToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("infinitesaw_id")
end
function MenuCallbackHandler:falldamageToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("falldamage_id")
end
function MenuCallbackHandler:interactlookaroundToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("interactlookaround_id")
end
function MenuCallbackHandler:removeobjectivesToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("removeobjectives_id")
end
function MenuCallbackHandler:ratsingredientsToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("ratsingredients_id")
end
function MenuCallbackHandler:interactthruwallsToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("interactthruwalls_id")
end
function MenuCallbackHandler:interactiondistanceToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("interactiondistance_id")
end
function MenuCallbackHandler:interactionspeedToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("interactionspeed_id")
end
function MenuCallbackHandler:pagerchanceToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("pagerchance_id")
end
function MenuCallbackHandler:cloakerwhineToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("cloakerwhine_id")
end
function MenuCallbackHandler:realnamesToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("realnames_id")
end
function MenuCallbackHandler:geezbolaToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("geezbola_id")
end
function MenuCallbackHandler:infinitedozersToggle(item)
    io.write("Toggle value: " .. tostring(item:value()) .. "\n")
    LocalizationStringManagerBooleanCallBack("infinitedozers_id")
end

local menu_manager_init_orig = MenuManager.init
function MenuManager:init(is_start_menu)
	menu_manager_init_orig(self, is_start_menu)
	addCustomMenu()
end

function addSubmenu(name, title, desc, parent)
	local mainMenuNodes = managers.menu._registered_menus.menu_main and managers.menu._registered_menus.menu_main.logic._data._nodes or
	managers.menu._registered_menus.menu_pause.logic._data._nodes

	local newNode = deep_clone(mainMenuNodes.video)
	newNode._items = {}

	MenuManager:add_back_button(newNode)
	mainMenuNodes[name] = newNode

	local button = deep_clone( mainMenuNodes.options._items[1] )
	button._parameters.name = name
	button._parameters.text_id = title
	button._parameters.help_id = desc
	button._parameters.next_node = name

	parent:add_item(button)
	return newNode
end
  
function addMultichoice(name, title, desc, cbk, value, parent)
	local data = {
		type = "MenuItemMultiChoice",
		{
			_meta = "option",
			text_id = "multichoice0",
			value = 0
		},
		{
			_meta = "option",
			text_id = "multichoice1",
			value = 1
		}
	}
			  
	local params = {
		name = name,
		text_id = title,
		help_id = desc,
		callback = cbk,
		filter = true
	}
			  
	local menuItem = parent:create_item(data, params)
	menuItem:set_value( math.clamp(value, data.min, data.max) or data.min )
	parent:add_item(menuItem)
end
  
function addSlider(name, title, desc, cbk, value, parent)
	local data = {
		type = "CoreMenuItemSlider.ItemSlider",
		min = 0,
		max = 1,
		step = 0.1,
		show_value = true
	}

	local params = {
		name = name,
		text_id = title,
		help_id = desc,
		callback = cbk,
		disabled_color = Color(0.25, 1, 1, 1),
	}

	local menuItem = parent:create_item(data, params)
	menuItem:set_value( math.clamp(value, data.min, data.max) or data.min )
	parent:add_item(menuItem)
end
  
function addToggle(name, title, desc, cbk, value, parent)
	local data = {
		type = "CoreMenuItemToggle.ItemToggle",
		{
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			value = true,
			x = 24,
			y = 0,
			w = 24,
			h = 24,
			s_icon = "guis/textures/menu_tickbox",
			s_x = 24,
			s_y = 24,
			s_w = 24,
			s_h = 24
		},
		{
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			value = false,
			x = 0,
			y = 0,
			w = 24,
			h = 24,
			s_icon = "guis/textures/menu_tickbox",
			s_x = 0,
			s_y = 24,
			s_w = 24,
			s_h = 24
		}
	}

	local params = {
		name = name,
		text_id = title,
		help_id = desc,
		callback = cbk,
		disabled_color = Color( 0.25, 1, 1, 1 ),
		icon_by_text = false
	}

	local menuItem = parent:create_item( data, params )
	menuItem:set_value( value and true or false )
	parent:add_item( menuItem )
end
  
function addCustomMenu()
	local mainMenuNodes = managers.menu._registered_menus.menu_main and managers.menu._registered_menus.menu_main.logic._data._nodes or
	managers.menu._registered_menus.menu_pause.logic._data._nodes
		  
	local menuEntry = deep_clone(mainMenuNodes.video)
	menuEntry._items = {}
		  
	MenuManager:add_back_button(menuEntry)
	mainMenuNodes["mainmenu_name"] = menuEntry

	local optionsButton = deep_clone( mainMenuNodes.options._items[1] )
	optionsButton._parameters.name = "mainmenu_name"
	optionsButton._parameters.text_id = "mainmenu_name"
	optionsButton._parameters.help_id = "mainmenu_desc"
	optionsButton._parameters.next_node = "mainmenu_name"
	mainMenuNodes.options:add_item(optionsButton)
	
	addToggle("toggle_pocohud", "pocohud_name", "pocohud_desc", "pocohudToggle", tweak_data.ACPConfig.PocoHUD_Enable, menuEntry)
	addToggle("toggle_stamina", "infinitestamina_name", "infinitestamina_desc", "infinitestaminaToggle", tweak_data.ACPConfig.Infinite_Stamina, menuEntry)
	addToggle("toggle_flashbangs", "flashbangs_name", "flashbangs_desc", "flashbangsToggle", tweak_data.ACPConfig.No_Flashbangs, menuEntry)
	addToggle("toggle_joinpause", "joinpause_name", "joinpause_desc", "joinpauseToggle", tweak_data.ACPConfig.Disable_Join_Pause, menuEntry)
	addToggle("toggle_grenaderefill", "grenaderefill_name", "grenaderefill_desc", "grenaderefillToggle", tweak_data.ACPConfig.Grenade_Refill, menuEntry)
	addToggle("toggle_infinitesaw", "infinitesaw_name", "infinitesaw_desc", "infinitesawToggle", tweak_data.ACPConfig.Infinite_Saw, menuEntry)
	addToggle("toggle_falldamage", "falldamage_name", "falldamage_desc", "falldamageToggle", tweak_data.ACPConfig.No_Fall_Damage, menuEntry)
	addToggle("toggle_interactlookaround", "interactlookaround_name", "interactlookaround_desc", "interactlookaroundToggle", tweak_data.ACPConfig.Interact_Lookaround, menuEntry)
	addToggle("toggle_removeobjectives", "removeobjectives_name", "removeobjectives_desc", "removeobjectivesToggle", tweak_data.ACPConfig.Remove_Objectives, menuEntry)
	addToggle("toggle_ratsingredients", "ratsingredients_name", "ratsingredients_desc", "ratsingredientsToggle", tweak_data.ACPConfig.Rats_Ingredients, menuEntry)
	addToggle("toggle_interactthruwalls", "interactthruwalls_name", "interactthruwalls_desc", "interactthruwallsToggle", tweak_data.ACPConfig.Interact_Thru_Walls, menuEntry)
	addToggle("toggle_interactiondistance", "interactiondistance_name", "interactiondistance_desc", "interactiondistanceToggle", tweak_data.ACPConfig.Increased_Int_Distance, menuEntry)
	addToggle("toggle_interactionspeed", "interactionspeed_name", "interactionspeed_desc", "interactionspeedToggle", tweak_data.ACPConfig.Increased_Int_Speed, menuEntry)
	addToggle("toggle_pagerchance", "pagerchance_name", "pagerchance_desc", "pagerchanceToggle", tweak_data.ACPConfig.Pager_Chance, menuEntry)
	addToggle("toggle_cloakerwhine", "cloakerwhine_name", "cloakerwhine_desc", "cloakerwhineToggle", tweak_data.ACPConfig.Stop_Cloaker_Whine, menuEntry)
	addToggle("toggle_realnames", "realnames_name", "realnames_desc", "realnamesToggle", tweak_data.ACPConfig.Real_Names, menuEntry)
	addToggle("toggle_geezbola", "geezbola_name", "geezbola_desc", "geezbolaToggle", tweak_data.ACPConfig.KA_Client, menuEntry)
	addToggle("toggle_infinitedozers", "infinitedozers_name", "infinitedozers_desc", "infinitedozersToggle", tweak_data.ACPConfig.Infinite_Dozers, menuEntry)	
end