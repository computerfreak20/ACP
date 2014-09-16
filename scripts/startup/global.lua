if tweak_data and tweak_data.ACPConfig then
	
	-------------------------------------------------------------------------
	-- Utility Functions
	-------------------------------------------------------------------------
	-- HACK VERSION
	if MenuNodeMainGui then
		function MenuNodeMainGui:_setup_item_rows(node)
			MenuNodeMainGui.super._setup_item_rows(self, node)
			if alive(self._version_string) then
				self._version_string:parent():remove(self._version_string)
				self._version_string = nil
			end
		Color.Gold = Color("FDD017")
		self._version_string = self.ws:panel():text({
			name = "version_string",
			text = "Welcome to ACP v" .. string.format("%.2f", tweak_data.ACPConfig.Version) .. ", " .. managers.network.account:username() .. "! \nPress Home to access the Menu",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			color = Color.Gold,
			align = SystemInfo:platform() == Idstring("WIN32") and "center",
			vertical = "top",
			alpha = 0.9
		})
		end
	end

	-- INGAME CHECK
	function inGame()
		if not game_state_machine then return false end
		return string.find(game_state_machine:current_state_name(), "game")
	end
	-- Titlescreen check
	function inTitlescreen()
		if not game_state_machine then return false end
		return string.find(game_state_machine:current_state_name(), "titlescreen")
	end
	-- MANAGER CHECK
	if not managers then return end
	-- SIMPLE MENU
	if not SimpleMenu then
		SimpleMenu = class()

		function SimpleMenu:init(title, message, options)
			self.dialog_data = { title = title, text = message, button_list = {},
								 id = tostring(math.random(0,0xFFFFFFFF)) }
			self.visible = false
			for _,opt in ipairs(options) do
				local elem = {}
				elem.text = opt.text
				opt.data = opt.data or nil
				opt.callback = opt.callback or nil
				elem.callback_func = callback(self, self, "_do_callback",
											  { data = opt.data,
												callback = opt.callback})
				elem.cancel_button = opt.is_cancel_button or false
				if opt.is_focused_button then
					self.dialog_data.focus_button = #self.dialog_data.button_list+1
				end
				table.insert(self.dialog_data.button_list, elem)
			end
			return self
		end

		function SimpleMenu:_do_callback(info)
			if info.callback then
				if info.data then
					info.callback(info.data)
				else
					info.callback()
				end
			end
			self.visible = false
		end

		function SimpleMenu:show()
			if self.visible then
				return
			end
			self.visible = true
			managers.system_menu:show(self.dialog_data)
		end

		function SimpleMenu:hide()
			if self.visible then
				managers.system_menu:close(self.dialog_data.id)
				self.visible = false
				return
			end
		end
	end

	patched_update_input = patched_update_input or function (self, t, dt )
		if self._data.no_buttons then
			return
		end
		
		local dir, move_time
		local move = self._controller:get_input_axis( "menu_move" )

		if( self._controller:get_input_bool( "menu_down" )) then
			dir = 1
		elseif( self._controller:get_input_bool( "menu_up" )) then
			dir = -1
		end
		
		if dir == nil then
			if move.y > self.MOVE_AXIS_LIMIT then
				dir = 1
			elseif move.y < -self.MOVE_AXIS_LIMIT then
				dir = -1
			end
		end

		if dir ~= nil then
			if( ( self._move_button_dir == dir ) and self._move_button_time and ( t < self._move_button_time + self.MOVE_AXIS_DELAY ) ) then
				move_time = self._move_button_time or t
			else
				self._panel_script:change_focus_button( dir )
				move_time = t
			end
		end

		self._move_button_dir = dir
		self._move_button_time = move_time
		
		local scroll = self._controller:get_input_axis( "menu_scroll" )
		-- local sdir
		if( scroll.y > self.MOVE_AXIS_LIMIT ) then
			self._panel_script:scroll_up()
			-- sdir = 1
		elseif( scroll.y < -self.MOVE_AXIS_LIMIT ) then
			self._panel_script:scroll_down()
			-- sdir = -1
		end
	end
	managers.system_menu.DIALOG_CLASS.update_input = patched_update_input
	managers.system_menu.GENERIC_DIALOG_CLASS.update_input = patched_update_input
	
	-- SIMPLE MENU V3 By: Baldwin
	SimpleMenuV3 = SimpleMenuV3 or class(SimpleMenu)

	function SimpleMenuV3:init(title, message, options, mode)
		self.mode = mode or 1 --Modes: 0 no switch_back, 1 switch_back support
		self.dialog_data = { title = title, text = message, button_list = {}, id = tostring(math.random(0,0xFFFFFFFF)) }
		self.visible = false
		for _,opt in ipairs(options) do
			local elem = {}
			elem.text = opt.text
			opt.data = opt.data or nil
			opt.callback = opt.callback or nil
			elem.callback_func = callback(self, self, "_do_callback",{ data = opt.data, callback = opt.callback, come_back = opt.switch_back }) --Switch back can be function to execute after click aswell
			elem.cancel_button = opt.is_cancel_button or false
			if opt.is_focused_button then
				self.dialog_data.focus_button = #self.dialog_data.button_list+1
			end
			table.insert(self.dialog_data.button_list, elem)
		end
		return self
	end

	function SimpleMenuV3:show()
		--If any other dialog opened then we close it and show a new one instantly
		if SimpleMenuV3.__current_menu then
			SimpleMenuV3.__current_menu:hide(true)
		end
		self.super.show(self)
		SimpleMenuV3.__current_menu = self
	end

	function SimpleMenuV3:hide( conflict )
		if not conflict or not self.persisted then
			self.super.hide(self)
			--Emitate cancel button click
			for _,btn in pairs(self.dialog_data.button_list) do
				if btn.cancel_button then
					btn.callback_func()
			end    end
			SimpleMenuV3.__current_menu = nil
	end    end

	function SimpleMenuV3:_do_callback(info)
		if info.callback then
			local err, res = pcall(info.callback, info.data)
			if not err then
				m_log_error('SimpleMenuV3:_do_callback()', res)
		end    end
		if info.come_back and self.mode == 1 then
			if type(info.come_back) == 'function' then
				info.come_back()
			else
				--self:hide()
				self:show()
	end    end    end
		
	-- SORTED DIALOG By: Baldwin
	local max_entries = 25 --Max ammount of entries being added into single dialog
	local insert = table.insert
	local SimpleMenuV3NoReshow = false
	show_sorted_dialog = function(title,text,data,fallback,mx,n)
		if not n or n < 1 then
			n = 1
		end
		local max_entries = mx or max_entries
		local t_data = {
			{ text = 'Exit', is_cancel_button = true, switch_back = false },
		}
		if fallback then
			insert(t_data, { text = 'Return', callback = fallback, switch_back = false, })
		end
		if (#data - n >= max_entries) then --Since n starts with 1
			insert(t_data, { text = 'Next page', callback = function() show_sorted_dialog(title,text,data,fallback,mx,n+max_entries) end, switch_back = false, })
		end
		if n > 1 then
			insert(t_data, { text = 'Previous page', callback = function() show_sorted_dialog(title,text,data,fallback,mx,n-max_entries) end, switch_back = false, })
		end
		insert(t_data, {})
		for i=n,(max_entries+(n-1) < #data) and max_entries+(n-1) or #data do
			insert(t_data, data[i])
		end
		local menu = SimpleMenuV3:new(title, text, t_data, SimpleMenuV3NoReshow and 0)
		menu:show()
	end
	
	-- Open Menu Callback function
	function openmenu(menu)
    	menu:show()
	end

	-- CONSOLE TEXT
	function Console( text )
		io.stderr:write(text .. "\n")
	end
	
	-- IN CHAT CHECK
	function inChat()
		if managers.hud._chat_focus == true then
			return true
		end
	end
	
	-- SHOW HINT
	function showHint(msg)
	if not managers or not managers.hud then 
		return 
	end
	managers.hud:show_hint({text = msg})
	end

	-- MIDTEXT	
	function show_mid_text( msg, msg_title, show_secs )
		if managers and managers.hud then
			managers.hud:present_mid_text( { text = msg, title = msg_title, time = show_secs } )
		end
	end
	
	-- SHOW CHATMSG	
	function ChatMessage(message, username)
		if not managers or not managers.chat or not message then return end
		if not username then username = managers.network.account:username() end
		managers.chat:receive_message_by_name(1, username, message)
	end

	-- SHOW SYSTEMMSG
	function SystemMessage(message)
		if not managers or not managers.chat or not message then return end
		managers.chat:_receive_message(1, managers.localization:to_upper_text( "menu_system_message" ), message, tweak_data.system_chat_color)
	end
	
	-- MSG USER
	function SendMessage(message, username)
		if not managers or not managers.chat or not message then return end
		if not username then username = managers.network.account:username() end
		managers.chat:send_message(1, username, message)
	end

	-- BEEP
	function beep()
		if managers and managers.menu_component then
			managers.menu_component:post_event("menu_enter")
		end
	end
	 
	-- IS PLAYING CHECK
	function isPlaying()
		if not BaseNetworkHandler then return false end
		return BaseNetworkHandler._gamestate_filter.any_ingame_playing[ game_state_machine:last_queued_state_name() ]
	end
	
	-- IS LOADING CHECK
	function isLoading()
		if not BaseNetworkHandler then return false end
		return BaseNetworkHandler._gamestate_filter.waiting_for_players[ game_state_machine:last_queued_state_name() ]
	end
	
	-- SERVER CHECK	
	function isServer()
		if not Network then return false end
		return Network:is_server()
	end
	
	-- CLIENT CHECK
	function isClient()
		if not Network then return false end
		return Network:is_client()
	end

	-- HOST CHECK
	function isHost()
		if not Network then return false end
		return not Network:is_client()
	end
	
	-- IS SINGLEPLAYER
	function isSinglePlayer()
		return Global.game_settings.single_player or false
	end

	-- IN CUSTODY
	function inCustody()
		local player = managers.player:local_player()
		local in_custody = false
		if managers and managers.trade and alive( player ) then
			in_custody = managers.trade:is_peer_in_custody(managers.network:session():local_peer():id())
		end
		return in_custody
	end
	
	-- IN STEELSIGHT
	function inSteelsight()
		local player = managers.player:local_player()
		local in_steelsight = false
		if player and alive( player ) then
			in_steelsight = player:movement() and player:movement():current_state() and player:movement():current_state():in_steelsight() or false
		end
		return in_steelsight
	end
	
	-- IS PRIMARY
	function isPrimary(type)
		local primary = managers.blackmarket:equipped_primary()
		if primary then
			local category = tweak_data.weapon[ primary.weapon_id ].category
			if category == string.lower(type) then
				return true
			end
		end
		return false
	end
 
	-- IS SECONDARY
	function isSecondary(type)
		local secondary = managers.blackmarket:equipped_secondary()
		if secondary then
			local category = tweak_data.weapon[ secondary.weapon_id ].category
			if category == string.lower(type) then
				return true
			end
		end
		return false
	end
			
	-- IN TABLE
	function in_table( table, value )
		if table ~= nil then 
			for i,x in pairs(table) do 
				if x == value then 
					return true 
				end
			end
		end
		return false
	end
	
	--  GET XHAIR POS
	function get_crosshair_pos(penetrate, from_pos, mvec_to)
		local ray = get_crosshair_ray(penetrate, from_pos, mvec_to)
		if not ray then return false end
		return ray.hit_position
	end

	-- IN CROSSHAIR	
	function get_crosshair_ray(penetrate, slotMask)
	  if not slotMask then slotMask = "bullet_impact_targets" end
	  local player = managers.player:player_unit()
	  local fromPos = player:camera():position()
	  local mvecTo = Vector3()
	  mvector3.set(mvecTo, player:camera():forward())
	  mvector3.multiply(mvecTo, 20000)
	  mvector3.add(mvecTo, fromPos)
	  local colRay = World:raycast("ray", fromPos, mvecTo, "slot_mask", managers.slot:get_mask(slotMask))
	  if colRay and penetrate then
			  local offset = Vector3()
					mvector3.set(offset, player:camera():forward())
					mvector3.multiply(offset, 100)
			  mvector3.add(colRay.hit_position, offset)
	  end
	  return colRay
	end
	 
	-- COLOR CONVERSION
	function rPad(str, len, char)
	  if len - #str <= 0 then return str end
	  return str .. string.rep(char, len - #str)
	end
	 
	function lPad(str, len, char)
	  if len - #str <= 0 then return str end
	  return string.rep(char, len - #str) .. str
	end
	 
	function HexToDec(Hex) return tonumber("0x"..Hex) end
	function HexToRGB(Hex)
	  Hex = rPad(Hex:gsub("#",""), 6, '0')
	  return { tonumber("0x"..Hex:sub(1,2)), tonumber("0x"..Hex:sub(3,4)), tonumber("0x"..Hex:sub(5,6)) }
	end
	function DecToHex(num)
			if type(num) == "string" then num = tonumber(num) end
			return string.format("%02X", num)
	end
	function toInt(num) return num*255 end
	function toDec(num) return num/255 end
	function HexToVector(Hex)
	  Hex = HexToRGB(Hex)
	  return Vector3(toDec(Hex[1]), toDec(Hex[2]), toDec(Hex[3]))
	end
	function VectorToHex(v)
	  local RGB = { toInt(v.x), toInt(v.y), toInt(v.z) }
	  return DecToHex(RGB[1])..DecToHex(RGB[2])..DecToHex(RGB[3])
	end
	
    function lua_run(path)
        local file = io.open(path, "r")
        if file then
            local exe = loadstring(file:read("*all"))
            if exe then
                exe()
            else
                io.stderr:write("Error in '" .. path .. "'.\n")
            end
            file:close()
        else
            io.stderr:write("Couldn't open '" .. path .. "'.\n")
        end
    end
	
	--isHostage Check--
	function isHostage(unit)
		if unit and alive(unit) and
			((unit.brain and unit:brain().is_hostage and unit:brain():is_hostage()) or
			(unit.anim_data and (unit:anim_data().tied or unit:anim_data().hands_tied))) then
			return true
		end
	return false
	end
		
	-- SKIP INTRO
	if tweak_data.ACPConfig.Skip_Intro then
		if not game_state_machine then return end
		if not SkipIntro then
		SkipIntro = true
		game_state_machine:change_state_by_name("menu_titlescreen")
		end
	end

	--DLC Unlocker
	if tweak_data.ACPConfig.DLC_Unlocker then
		if not GenericDLCManager then return end
		function GenericDLCManager:has_pd2_clan()
			return true
		end
		for dlc_name, dlc_data in pairs( Global.dlc_manager.all_dlc_data ) do
			dlc_name = { app_id = "218620", no_install = true }
			dlc_data.verified = true
		end
	end
	
	-- Write Tables to File
	function Console(text)
		io.stderr:write(text .. "\n")
	end
	function table_print(tt, done)
		local file = io.open("TableDump.txt", "a+")
		done = done or {}
		if type(tt) == "table" then
			for key, value in pairs(tt) do
				if type(value) == "table" and not done[value] then
					done[value] = true
					file:write("<"..tostring(key).."> => table\n")
					table_print(value, done)
				else
					file:write("["..tostring(key).."] => "..tostring(value).."\n")
				end
			end
		else 
			file:write(tostring(tt).."\n")
		end
		file:close()
	end
end