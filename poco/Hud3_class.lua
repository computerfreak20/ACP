---
local ALTFONT = 'fonts/font_eroded'
local FONT =  'fonts/font_medium_mf' -- or tweak_data.hud_present.title_font or tweak_data.hud_players.name_font or 'fonts/font_eroded' or 'core/fonts/system_font'
local FONTLARGE = 'fonts/font_large_mf'
local clGood =  cl.YellowGreen
local clBad =  cl.Gold
local isNil = function(a) return a == nil end
local inGame = CopDamage ~= nil

local Icon = {
	A=57344, B=57345,	X=57346, Y=57347, Back=57348, Start=57349,
	Skull = 57364, Ghost = 57363, Dot = 1031, Chapter = 1015, Div = 1014, BigDot = 1012,
	Times = 215, Divided = 247, LC=139, RC=155, DRC = 1035, Deg = 1024, PM= 1030, No = 1033,
}
for k,v in pairs(Icon) do
	Icon[k] = utf8.char(v)
end
local now = function () return managers.player:player_timer():time() --[[TimerManager:game():time()]] end
local PocoEvent = {
	In = 'onEnter',
	Out = 'onExit',
	Pressed = 'onPressed',
	Released = 'onReleased',
	PressedAlt = 'onPressedAlt',
	ReleasedAlt = 'onReleasedAlt',
	Click = 'onClick',
	WheelUp = 'onWheelUp',
	WheelDown = 'onWheelDown',
	Move = 'onMove',
}
local O, K, me
PocoHud3Class = {
	ALTFONT	= ALTFONT	,
	FONT		= FONT		,
	FONTLARGE = FONTLARGE,
	clGood	= clGood	,
	clBad		= clBad		,
	Icon		= Icon		,
	PocoEvent = PocoEvent,
}
PocoHud3Class.loadVar = function(_O,_me)
	O = _O
	me = _me
end

--- miniClass start ---
local TBuff = class()
PocoHud3Class.TBuff = TBuff
function TBuff:init(owner,data)
	self.owner = owner
	self.ppnl = owner.pnl.buff
	self:set(data)
end
function TBuff:set(data)
	self.dead = false
	local st = self.data and self.data.st
	self.data = data
	if st and data.et ~= 1 then
		self.data.st = st
	end
end
function TBuff:_make()
	local buffO = O:get('buff')
	local style = buffO.style
	local size = style==2 and 40 or buffO.buffSize
	local data = self.data
	local simple = self.owner:_isSimple(data.key)
	self.created = true
	if simple then
		local simpleRadius = buffO.simpleBusySize
		local pnl = self.ppnl:panel({x = self.owner.ww/2-simpleRadius,y=self.owner.hh/2-simpleRadius, w=simpleRadius*2,h=simpleRadius*2})
		self.pnl = pnl
		local texture = data.good and 'guis/textures/pd2/hud_progress_active' or 'guis/textures/pd2/hud_progress_invalid'
		self.pie = CircleBitmapGuiObject:new( pnl, { use_bg = false, x=0,y=0,image = texture, radius = simpleRadius, sides = 64, current = 20, total = 64, blend_mode = 'add', layer = 0} )
	elseif style == 2 then
		local pnl = self.ppnl:panel({x = 0,y=0, w=100,h=100})
		self.pnl = pnl
		self.lbl = pnl:text{text='', font=FONT, align='center', font_size = size/2, color = data.color or data.good and clGood or clBad, x=1,y=1, layer=2, blend_mode = 'normal'}
		self.bg = HUDBGBox_create( pnl, { w = size, h = size, x = 0, y = 0 }, { color = cl.White, blend_mode = 'normal' } )
		self.bmp = data.icon and pnl:bitmap( { name='icon', texture=data.icon, texture_rect=data.iconRect, blend_mode = 'add', layer=1, x=0,y=0, color=style==2 and cl.White or data.good and clGood or clBad } ) or nil
		local texture = data.good and 'guis/textures/pd2/hud_progress_active' or 'guis/textures/pd2/hud_progress_invalid'
		self.pie = CircleBitmapGuiObject:new( pnl, { use_bg = false, x=0,y=0,image = texture, radius = size/2, sides = 64, current = 20, total = 64, blend_mode = 'add', layer = 0} )
		self.pie:set_position( -size, 0)
		if self.bmp then
			local mul = style==2 and 1 or 0.7
			if self.bmp:width() > mul*size then
				self.bmp:set_size(mul*size,mul*size)
			end
			self.bmp:set_center(5+size + size/2,size/2)
		end
		pnl:set_shape(0,0,size*2+5,size*1.25)
		pnl:set_position(-100,-100)
	else
		local pnl = self.ppnl:panel({x = 0,y=0, w=100,h=100})
		self.pnl = pnl
		self.lbl = pnl:text{text='', font=FONT, font_size = size/4, color = data.color or data.good and clGood or clBad, x=1,y=1, layer=2, blend_mode = 'normal'}
		self.bg = pnl:bitmap( { name='bg', texture= 'guis/textures/pd2/hud_tabs',texture_rect=  { 105, 34, 19, 19 }, color= cl.Black:with_alpha(0.2), layer=0, x=0,y=0 } )
		self.bmp = data.icon and pnl:bitmap( { name='icon', texture=data.icon, texture_rect=data.iconRect, blend_mode = 'add', layer=1, x=0,y=0, color=data.good and clGood or clBad } ) or nil
		local texture = data.good and 'guis/textures/pd2/hud_progress_active' or 'guis/textures/pd2/hud_progress_invalid'
		self.pie = CircleBitmapGuiObject:new( pnl, { use_bg = false, x=0,y=0,image = texture, radius = size/2, sides = 64, current = 20, total = 64, blend_mode = 'add', layer = 0} )
		self.pie:set_position( 0, 0)
		if self.bmp then
			if self.bmp:width() > 0.7*size then
				self.bmp:set_size(0.7*size,0.7*size)
			end
			self.bmp:set_center(size/2,size/2)
		end
		pnl:set_shape(0,0,size,size*1.25)
		self.bg:set_size(size,size)
		pnl:set_position(-100,-100)
	end
end
function TBuff:draw(t,x,y)
	if not self.dead then
		if not self.created then
			self:_make()
		end
		local data = self.data
		local st,et = data.st,data.et
		local prog = (now()-st)/(et-st)
		local style = O:get('buff','style')
		local vanilla = style == 2
		local simple = self.owner:_isSimple(data.key)
		if (prog >= 1 or prog < 0) and et ~= 1 then
			self.dead = true
		elseif alive(self.pnl) then
			if et == 1 then
				prog = st
			end
			x = self.x and self.x + (x-self.x)/5 or x
			y = self.y and self.y + (y-self.y)/5 or y
			if not simple then
				self.pnl:set_center(x,y)
			end
			self.x = x
			self.y = y
			local txts
			if simple then

			elseif vanilla then
				local sTxt = self.owner:_lbl(nil,data.text)
				if et == 1 then -- Special
					sTxt = sTxt ~= '' and (sTxt or ''):gsub(' ','\n') or  _.f(prog*100,1)..'%'
				else
					sTxt = _.f(et-now(),1)..'s'
				end
				txts = {{sTxt,cl.White}}
			else
				if type(data.text)=='table' then
					txts = data.text
				else
					txts = {{data.text or '',data.color}}
					table.insert(txts,{_.f(et ~= 1 and et-now() or prog*100)..(et == 1 and '%' or 's'),data.good and clGood or clBad})
				end
			end
			if not simple then
				self.owner:_lbl(self.lbl,txts)
				local _x,_y,w,h = self.lbl:text_rect()
				self.lbl:set_size(w,h)
				if vanilla then
					local ww, hh = self.bg:size()
					self.lbl:set_center(ww/2,hh/2)
				else
					local ww, hh = self.pnl:size()
					self.lbl:set_center(ww/2,hh-h/2)
				end
			end
			self.pie:set_current(1-prog)
			if not self.dying then
				self.pnl:set_alpha(1)
			end
		end
	end
end
function TBuff:_fade(pnl, done_cb, seconds)
	local pnl = self.pnl
	pnl:set_visible( true )
	pnl:set_alpha( 1 )
	local t = seconds
	while t > 0 do
		if not self.dead then
			self.dying = false
			break
		end
		local dt = coroutine.yield()
		t = t - dt
		pnl:set_alpha((self.lastD or 1) * t/seconds )
	end
	if self.dying then
		pnl:set_visible( false )
		if done_cb then done_cb(pnl) end
	end
end
function TBuff:destroy(skipAnim)
	local pnl = self.pnl
	if self.created and alive(self.ppnl) and alive(pnl) then
		if not skipAnim then
			if not self.dying then
				self.dying = true
				pnl:stop()
				pnl:animate( callback( self, self, '_fade' ), callback( self, self, 'destroy' , true), 0.25 )
			end
		else
			self.ppnl:remove(self.pnl)
			self.owner.buffs[self.data.key] = nil
		end
	end
end
	-------
local TPop = class()
PocoHud3Class.TPop = TPop

function TPop:init(owner,data)
	self.owner = owner
	self.data = data
	self.data.st=now()
	self.ppnl = owner.pnl.pop
	self:_make()
end
function TPop:_make()
	local size = O:get('popup','size')
	local pnl = self.ppnl:panel({x = 0, y = 0, w=200, h=100})
		local data = self.data
	self.pnl = pnl
	self.lbl = pnl:text{text='', font=FONT, font_size = size, color = data.color or data.good and clGood or clBad, x=0,y=0, layer=3, blend_mode = 'add'}
	local _txt = self.owner:_lbl(self.lbl,data.text)
	self.lblBg = pnl:text{text=_txt, font=FONT, font_size = size, color = cl.Black, x=1,y=1, layer=2, blend_mode = 'normal'}
	local x,y,w,h = self.lblBg:text_rect()
	pnl:set_shape(-100,-100,w,h)
end
function TPop:draw(t)
	local isADS = self.owner.ADS
	local camPos = self.owner.camPos
	if not self.dead and alive(self.pnl) then
		local data = self.data
		local st,et = data.st,data.et
		local prog = (now()-st)/(et-st)
		local pos = data.pos + Vector3()
		local nl_dir = pos - camPos
		mvector3.normalize( nl_dir )
		local dot = mvector3.dot( self.owner.nl_cam_forward, nl_dir )
		self.pnl:set_visible( dot > 0 )
		if dot > 0 then
			local pPos = self.owner:_v2p(pos)
			if not data.stay then
				mvector3.set_y(pPos,pPos.y - math.lerp(100,0, math.pow(1-prog,7)))
			end

			if prog >= 1 then
				self.dead = true
			else
				local dx,dy,d,ww,hh = 0,0,1,self.owner.ww,self.owner.hh
				self.pnl:set_center( pPos.x,pPos.y)
				if isADS then
					dx = pPos.x - ww/2
					dy = pPos.y - hh/2
					d = math.clamp((dx*dx+dy*dy)/1000,0,1)
				else
					d = 1-math.pow(prog,5)
				end
				d = math.min(d,self.owner:_visibility(false))
				self.pnl:set_alpha(math.min(1-prog,d))
			end
		end
	end
end
function TPop:destroy(key)
	self.ppnl:remove(self.pnl)
	if key then
		self.owner.pops[key] = nil
	end
end

local TFloat = class()
PocoHud3Class.TFloat = TFloat
function TFloat:init(owner,data)
	self.owner = owner
	self.category = data.category
	self.unit = data.unit
	self.key = data.key
	self.tag = data.tag or {}
	self.temp = data.temp
	self.lastT = type(self.temp) == 'number' and self.temp or now()
	self.ppnl = owner.pnl.pop
	self:_make()
end
function TFloat:__shadow(x)
	if x then
		self.lblShadow1:set_x(x+1)
		self.lblShadow2:set_x(x-1)
	else
		self.lblShadow1:set_text(self._txts)
		self.lblShadow2:set_text(self._txts)
	end
end
function TFloat:_make()
	local floatO = O:get('float')
	local size = floatO.size
	local m = floatO.margin
	local pnl = self.ppnl:panel({x = 0,y=-size, w=300,h=100})
	local texture = 'guis/textures/pd2/hud_health' or 'guis/textures/pd2/hud_progress_32px'
	self.pnl = pnl
	self.bg = floatO.frame
		and HUDBGBox_create(pnl, {x= 0,y= 0,w= 1,h= 1},{color=cl.White:with_alpha(1)})
		or pnl:bitmap( { name='blur', texture='guis/textures/test_blur_df', render_template='VertexColorTexturedBlur3D', layer=-1, x=0,y=0 } )
	self.pie = CircleBitmapGuiObject:new( pnl, { use_bg = false, x=m,y=m,image = texture, radius = size/2, sides = 64, current = 20, total = 64, blend_mode = 'normal', layer = 4} )
	self.pieBg = pnl:bitmap( { name='pieBg', texture='guis/textures/pd2/hud_progress_active', w = size, h = size, layer=3, x=m,y=m, color=cl.Black:with_alpha(0.5) } )
	self.lbl = pnl:text{text='text', font=FONT, font_size = size, color = cl.White, x=size+m*2,y=m, layer=3, blend_mode = 'normal'}
	self.lblShadow1 = pnl:text{text='shadow', font=FONT, font_size = size, color = cl.Black:with_alpha(0.3), x=1+size+m*2,y=1+m, layer=2, blend_mode = 'normal'}
	self.lblShadow2 = pnl:text{text='shadow', font=FONT, font_size = size, color = cl.Black:with_alpha(0.3), x=size+m*2-1,y=1+m, layer=2, blend_mode = 'normal'}
end
local _drillNames = {
	drill = 'Drill',
	lance = 'Thermal Drill',
	uload_database = 'Upload',
	votingmachine2 = 'Voting Machine',
	hack_suburbia = 'Hacking Machine',
	digitalgui = 'Timelock',
	huge_lance = 'The Beast',
}
local _drillHosts = {
	['d2e9092f3a57cefc'] = 'a mini safe',
	['e87e439e3e1a7313'] = 'a mini titan safe',
	['ad6fb7a483695e19'] = 'a safe',
	['dbfbfbb21eddcd30'] = 'a titan safe',
	['3e964910f730f3d7'] = 'a huge safe',
	['246cc067a20249df'] = 'a huge titan safe',
	['8834e3a4da3df5c6'] = 'a tall safe',
	['e3ab30d889c6db5f'] = 'a tall titan safe',
	['4407f5e571e2f51a'] = 'a door',
	['0afafcebe54ae7c4'] = 'a cage door',
	['1153b673d51ed6ad'] = 'a Gensec truck',
	['04080fd150a77c7f'] = 'a crashed Gensec truck',
	['0d07ff22a1333115'] = 'a sniped Gensec truck',
	['a8715759c090b251'] = 'a fence door',
	['a7b371bf0e3fd30a'] = 'a truck hinge',
	['07e2cf254ef76c5e'] = 'a vault cage door',
}
local __n = {}
function TFloat:_getName()
	local name = self._name or 'Drill'
	local host = self._host
	local a = not name:find('The ') and 'A'
	if a then
		local n = name:sub(1,1):lower()
		if n == 'a' or n == 'e' or n == 'i' or n == 'o' or n == 'u' then
			a = a .. 'n'
		end
	end
	return _.s(a,name:lower(),host and 'on' or nil,host)
end
function TFloat:_getHost()
	local mD = self.unit and alive(self.unit) and self.unit:mission_door_device()
	local pD = mD and mD._parent_door
	local key = pD and pD:name():key()
	if key and not _drillHosts[key] then
		_(os.date(),'Found a new DrillHost',key,'\n')
	end
	return key and _drillHosts[key] or nil
end
function TFloat:draw(t)
	if not alive(self.unit) or (self.temp and (t-self.lastT>0.5)) and not self.dead then
		self.dead = true
	end
	if self.dead and not self.dying then
		self:destroy()
	end
	if not alive(self.pnl) then
		return
	end
	local floatO = O:get('float')
	local verbose = self.owner.verbose
	local onScr = floatO.keepOnScreen
	local size = floatO.size
	local m = floatO.margin
	local isADS = self.owner.ADS
	local camPos = self.owner.camPos
	local category = self.category
	local prog,txts = 0,{}
	local unit = self.unit
	if not alive(unit) then return end
	local dx,dy,d,pDist,ww,hh= 0,0,1,0,self.owner.ww,self.owner.hh
	if not ww then return end
	local pos = self.owner:_pos(unit,true)
	local nl_dir = pos - camPos
	local dir = pos - camPos
	mvector3.normalize( nl_dir )
	local dot = mvector3.dot( self.owner.nl_cam_forward, nl_dir )
	local pPos = self.owner:_v2p(pos)
	local out = false
	if onScr and (category == 1 or self.temp) then
		local _sm = {floatO.keepOnScreenMarginX,floatO.keepOnScreenMarginY}
		local sm = {x = _sm[1]/100, y = _sm[2]/100}
		local xm = {x = 1-sm.x, y = 1-sm.y}
		if dot < 0
			or pPos.x < sm.x*ww or pPos.y < sm.y*hh
			or pPos.x > xm.x*ww or pPos.y > xm.y*hh then
			local abs = math.abs
			local rr = (hh*(0.5-sm.y))/(ww*(0.5-sm.x))
			local cV = Vector3(ww/2,hh/2,0)
			local dV = pPos:with_z(0) - cV
			local mul = 1
			mvector3.normalize( dV )
			if abs(dV.x * rr) > abs(dV.y) then -- x
				mul = ww*(0.5-sm.x)/dV.x
			else -- y
				mul = hh*(0.5-sm.y)/dV.y
			end
			out = true
			pPos = cV + dV*abs(mul)
		end
	end
	dx = pPos.x - ww/2
	dy = pPos.y - hh/2
	pDist = dx*dx+dy*dy
	self.pnl:set_visible( (onScr and out) or dot > 0 )
	if dot > 0 or onScr then
		if category == 0 then -- Unit
			local cHealth = unit:character_damage() and unit:character_damage()._health and unit:character_damage()._health*10 or 0
			local fHealth = cHealth > 0 and unit:character_damage() and (unit:character_damage()._HEALTH_INIT and unit:character_damage()._HEALTH_INIT*10 or unit:character_damage()._health_max and unit:character_damage()._health_max*10 ) or 1
			prog = cHealth / fHealth
			local cCarry = unit:carry_data()
			local isCiv = unit and managers.enemy:is_civilian( unit )
			local color = isCiv and cl.Lime or math.lerp( cl.Red:with_alpha(0.8), cl.Yellow, prog )
			if self.tag and self.tag.minion then
				color = self.owner:_color(self.tag.minion)
			end
			local distance = unit and mvector3.distance( unit:position(), camPos ) or 0
			if cCarry then
				color = cl.White
				table.insert(txts,{managers.localization:text(tweak_data.carry[cCarry._carry_id].name_id) or 'Bag',color})
			else
				local isWhisper = managers.groupai:state():whisper_mode()
				local pager = isWhisper and unit:interaction()._pager
				if pager then
					local eT,tT = now()-pager, unit:interaction()._pagerT or 12
					local r = eT/tT
					local pColor = math.lerp( cl.Red:with_alpha(0.8), cl.Yellow, 1-r )
					if r < 1 then
						prog = 1 - r
						table.insert(txts,{_.s(_.f(tT - eT),'/',_.f(tT)),pColor})
					end
				end
				if pDist > 100000 then
					--table.insert(txts,{''})
				elseif cHealth == 0 then
					table.insert(txts,{Icon.Skull,color})
				else
					table.insert(txts,{_.f(cHealth)..'/'.._.f(fHealth),color})
					if verbose then
					table.insert(txts,{' '..math.ceil(dir:length()/100)..'m',cl.White})
					end
				end
			end
			pPos = pPos:with_y(pPos.y-size*2)
		end
		if category == 1 then -- Drill
			local tGUI = unit and unit:timer_gui()
			local dGUI = unit and unit:digital_gui()
			local name
			local leftT
			if not alive(unit) then
				self.dead = true
			elseif tGUI then
				if tGUI._time_left <= 0 then
					self.dead = true
				end
				name = unit and unit:interaction() and unit:interaction().tweak_data
				name = name and name:gsub('_jammed',''):gsub('_upgrade','') or 'drill'
				name = _drillNames[name] or 'Drill'
				leftT = tGUI._time_left
				prog = 1-tGUI._time_left/tGUI._timer
				if pDist < 10000 or verbose then
					table.insert(txts,{_.s(name..':',self.owner:_time(tGUI._time_left)..(tGUI._jammed and '!' or ''),'/',self.owner:_time(tGUI._timer)),tGUI._jammed and cl.Red or cl.White})
				else
					table.insert(txts,{_.s(self.owner:_time(tGUI._time_left))..(tGUI._jammed and '!' or ''),tGUI._jammed and cl.Red or cl.White})
				end
			elseif dGUI then
				dGUI._maxx = math.max( dGUI._maxx or 0, dGUI._timer or 0)
				if not (dGUI._ws and dGUI._ws:visible()) or dGUI._floored_last_timer <= 0 then
					return self:destroy(1)
				else
					self:renew()
				end
				name = 'digitalgui'
				name = _drillNames[name] or 'Timelock'
				leftT = dGUI._timer
				prog = 1-dGUI._timer/math.max(dGUI._maxx,1)
				if pDist < 10000 or self.owner.verbose then
					table.insert(txts,{_.s(name..':',self.owner:_time(dGUI._timer),'/',self.owner:_time(dGUI._maxx)),cl.White})
				else
					table.insert(txts,{_.s(self.owner:_time(dGUI._timer)),cl.White})
				end
			end
			if not self._name then
				self._name = name
				self._host = self:_getHost()
			end
			self.isDrill = not not tGUI
			if self.isDrill and not self._almost and leftT and leftT <= 10 then
				self._almost = true
				me:Chat('drillAlmostDone',_.s(self:_getName(),' < 10s left'))
			end
		end
		if category == 2 then -- Deadsimple text
			local name = self.tag and self.tag.text
			if name and (pDist < 1e6/dir:length() or verbose) then
				table.insert(txts,{name,cl.White})
			end
			pPos = pPos:with_y(pPos.y-size)
			self.bg:set_visible(false)
			prog = 0
		end
		if prog > 0 then
			self.pie:set_current(prog)
			self.pieBg:set_visible(true)
			self.lbl:set_x(2*m+size)
			self:__shadow(2*m+size)
		else
			self.pie:set_visible(false)
			self.pieBg:set_visible(false)
			self.lbl:set_x(m)
			self:__shadow(m)
		end
		if self._txts ~= self.owner:_lbl(nil,txts) then
			self._txts = self.owner:_lbl(self.lbl,txts)
			self:__shadow()
		end
		local __,__,w,h = self.lbl:text_rect()
		h = math.max(h,size)
		self.pnl:set_size(m*2+(w>0 and w+m+1 or 0)+(prog>0 and size or 0),h+2*m)
		self.bg:set_size(self.pnl:size())
		self.pnl:set_center( pPos.x,pPos.y)
		if isADS then
			d = math.clamp((pDist-1000)/2000,0.4,1)
		else
			d = 1
		end
		d = math.min(d,floatO.opacity/100)
		if not (unit and unit:contour() and #(unit:contour()._contour_list or {}) > 0) then
			d = math.min(d,self.owner:_visibility(pos))
		end
		if out then
			d = math.min(d,0.5)
		end
		if not self.dying then
			self.pnl:set_alpha(d)
			self.lastD = d -- d is for starting alpha
		end
	end
end
function TFloat:renew(data)
	if data then
		self.tag = data.tag
		if type(data.temp)=='number' then
			self.temp = data.temp
			self.lastT = math.max(self.lastT,data.temp)
		end
	end
	if self.temp then
		self.lastT = math.max(self.lastT,now())
	end
	self.dead = false
end
function TFloat:destroy(skipAnim)
	if self.category == 1 and self.isDrill and not self._done then
		local r,err = pcall(function()
			self._done = true
			me:Chat('drillDone',_.s(self:_getName(),'is done'))
		end)
		if not r then me:err(err) end
	end

	local pnl = self.pnl
	if alive(self.ppnl) and alive(pnl) then
		if not skipAnim then
			if not self.dying then
				self.dying = true
				pnl:stop()
				pnl:animate( callback( self, TBuff, '_fade' ), callback( self, self, 'destroy' , true), 0.2 )
			end
		else
			self.ppnl:remove(self.pnl)
			self.owner.floats[self.key] = nil
		end
	end
end
local THitDirection = class()
PocoHud3Class.THitDirection = THitDirection
function THitDirection:init(owner,data)
	self.owner = owner
	self.ppnl = owner.pnl.buff
	self.data = data
	self.sT = now()
	local pnl = self.ppnl:panel{x = 0,y=0, w=200,h=200}
	local Opt = O:get('hit')
	local rate, color = 1-(data.rate or 1)
	color = data.shield and math.lerp( Opt.shieldColor, Opt.shieldColorDepleted, rate ) or math.lerp( Opt.healthColor, Opt.healthColorDepleted, rate )

	self.pnl = pnl
	local bmp = pnl:bitmap{
		name = 'hit', rotation = 360, visible = true,
		texture = 'guis/textures/pd2/hitdirection',
		color = color,
		blend_mode='add', alpha = 1, halign = 'right'
	}
	self.bmp = bmp
	bmp:set_center(100,100)
	if Opt.number then
		local nSize = Opt.numberSize
		local font = Opt.numberDefaultFont and FONT or ALTFONT
		local lbl = pnl:text{
			x = 1,y = 1,font = font, font_size = nSize,
			w = nSize*3, h = nSize,
			text = '-'.._.f(data.dmg*10),
			color = color,
			align = 'center',
			layer = 1
		}
		lbl:set_center(100,100)
		self.lbl = lbl
		lbl = pnl:text{
			x = 1,y = 1,font = font, font_size = nSize,
			w = nSize*3, h = nSize,
			text = '-'.._.f(data.dmg*10),
			color = cl.Black:with_alpha(0.2),
			align = 'center',
			layer = 1
		}
		lbl:set_center(101,101)
		self.lbl1 = lbl
		lbl = pnl:text{
			x = 1,y = 1,font = font, font_size = nSize,
			w = nSize*3, h = nSize,
			text = '-'.._.f(data.dmg*10),
			color = cl.Black:with_alpha(0.2),
			align = 'center',
			layer = 1
		}
		lbl:set_center(99,101)
		self.lbl2 = lbl
	end
	pnl:stop()
	local du = Opt.duration
	if du == 0 then
		du = self.data.time or 2
	end
	pnl:animate( callback( self, self, 'draw' ), callback( self, self, 'destroy'), du )
end
function THitDirection:draw(pnl, done_cb, seconds)
	local pnl = self.pnl
	local Opt = O:get('hit')
	local ww,hh = self.owner.ww, self.owner.hh
	pnl:set_visible( true )
	self.bmp:set_alpha( 1 )
	local t = seconds
	while t > 0 do
		if self.owner.dead then
			break
		end
		local dt = coroutine.yield()
		t = t - dt
		local p = t/seconds
		self.bmp:set_alpha( math.pow(p,0.5) * Opt.opacity/100 )

		local target_vec = self.data.mobPos - self.owner.camPos
		local fwd = self.owner.nl_cam_forward
		local angle = target_vec:to_polar_with_reference( fwd, math.UP ).spin
		local r = Opt.sizeStart + (1-math.pow(p,0.5)) * (Opt.sizeEnd-Opt.sizeStart)

		self.bmp:set_rotation(-(angle+90))
		if self.lbl then
			self.lbl:set_rotation(-(angle))
			self.lbl1:set_rotation(-(angle))
			self.lbl2:set_rotation(-(angle))
		end
		pnl:set_center(ww/2-math.sin(angle)*r,hh/2-math.cos(angle)*r)
	end
	pnl:set_visible( false )
	if done_cb then done_cb(pnl) end
end
function THitDirection:destroy()
	self.ppnl:remove(self.pnl)
	self = nil
end

--- GUI start ---
local Layers = {
	Blur = 1001,
	Bg = 1002,
	TabHeader = 1003
}
local PocoUIElem = class()
local PocoUIHintLabel -- forward-declared
function PocoUIElem:init(parent,config)
	config = _.m({
		w = 400,h = 20,
	}, config)

	self.parent = parent
	self.config = config or {}
	self.ppnl = config.pnl or parent.pnl
	self.pnl = self.ppnl:panel({ name = config.name, x=config.x, y=config.y, w = config.w, h = config.h})
	self.status = 0

	if self.config[PocoEvent.Click] then
		self:_bind(PocoEvent.Out, function(self)
			self._pressed = nil
		end):_bind(PocoEvent.Pressed, function(self,x,y)
			self._pressed = true
		end):_bind(PocoEvent.Released, function(self,x,y)
			if self._pressed then
				self._pressed = nil
				return self:fire(PocoEvent.Click,x,y)
			end
		end)
	end

	if config.hintText then
		PocoUIHintLabel.makeHintPanel(self)
	end
end

function PocoUIElem:postInit()
	for event,eventVal in pairs(PocoEvent) do
		if self.config[eventVal] then
			self.parent:addHotZone(eventVal,self)
		end
	end
	self._bind = function()
		_('Warning:PocoUIElem._bind was called too late')
	end
end

function PocoUIElem:set_y(y)
	self.pnl:set_y(y)
end
function PocoUIElem:set_center_x(x)
	self.pnl:set_center_x(x)
end
function PocoUIElem:set_x(x)
	self.pnl:set_x(x)
end
function PocoUIElem:inside(x,y)
	return alive(self.pnl) and self.pnl:inside(x,y)
end

function PocoUIElem:_bind(eventVal,cbk)
	if not self.config[eventVal] then
		self.config[eventVal] = cbk
	else
		local _old = self.config[eventVal]
		self.config[eventVal] = function(...)
			local result = _old(...)
			if not result then
				result = cbk(...)
			else
			end
			return result
		end
	end
	return self
end

function PocoUIElem:sound(sound)
	managers.menu_component:post_event(sound)
end


function PocoUIElem:isHot(event,x,y)
	return alive(self.pnl) and self.pnl:inside(x,y)
end

function PocoUIElem:fire(event,x,y)
	if self.parent.dead or not alive(self.pnl) then return end
	local result = {self.config[event](self,x,y)}
	local sound = {
		onPressed = 'prompt_enter'
	}
	if self.config[event] then
		if self.result == false then
			self:sound('menu_error')
			self.result = nil
			return true
		elseif self.mute then
			self.mute = nil
			return true
		end
		if sound[event] then
			self:sound(sound[event])
		end
		return unpack(result)
	end
end

local PocoRoseButton = class(PocoUIElem)
PocoHud3Class.PocoRoseButton = PocoRoseButton
function PocoRoseButton:init(parent,config,inherited)
	self.super.init(self,parent,config,true)
	self.pnl:set_center(config.x,config.y)

	local spnl
	local clShadow = cl.Black:with_alpha(0.8)
	local __, lbl = _.l({
		pnl = self.pnl,x=-1, y=0, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = clShadow,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text,config.autoSize)
	self.lbl1 = lbl
	__, lbl = _.l({
		pnl = self.pnl,x=0, y=1, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = clShadow,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text,config.autoSize)
	self.lbl2 = lbl
	__, lbl = _.l({
		pnl = self.pnl,x=1, y=0, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = clShadow,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text,config.autoSize)
	self.lbl3 = lbl
	__, lbl = _.l({
		pnl = self.pnl,x=0, y=-1, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = clShadow,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text,config.autoSize)
	self.lbl4 = lbl
	__, lbl = _.l({
		pnl = self.pnl,x=0, y=0, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = config.fontColor or cl.White,
		align = config.align or 'center', vertical = config.vAlign or 'center', layer = 1
	},config.text,config.autoSize)
	self.lbl = lbl
	self.mul = 1
	self.pnl:animate(function(p)
		while alive(p) do
			local mul = math.ceil(100*self.mul)/100
			local t = config.fontSize*mul
			local r = self._r or 0
			r = r + (t-r)/10
			if p:visible() and math.abs(r - (self._r or 0)) > 0.1 then
				self._r = r
				self.lbl1:set_font_size(r)
				self.lbl2:set_font_size(r)
				self.lbl3:set_font_size(r)
				self.lbl4:set_font_size(r)
				self.lbl:set_font_size(r)
				self.lbl:set_alpha(r/config.fontSize/1.4)
			end
			coroutine.yield()
		end
	end)


	self:_bind(PocoEvent.In, function(self,x,y)
		if alive(self.pnl) then
			spnl = self.pnl:panel{}
			BoxGuiObject:new(spnl, {sides = {1,1,1,1}})
			spnl:rect{color=cl.Black,alpha=0.2,layer=-1}
			me._say = config.value
			self:sound('slider_grab')
			self.mul = 1.6
		end
	end):_bind(PocoEvent.Out, function(self,x,y)
		if alive(self.pnl) then
			if spnl then
				self.pnl:remove(spnl)
				spnl = nil
			end
			self.mul = 1
			me._say = nil
		end
	end)
	if not inherited then
		self:postInit(self)
	end
end


PocoUIHintLabel = class(PocoUIElem) -- Forward-declared as local
PocoHud3Class.PocoUIHintLabel = PocoUIHintLabel
function PocoUIHintLabel:init(parent,config,inherited)
	self.super.init(self,parent,config,true)

	local __, lbl = _.l({
		pnl = self.pnl,x=0, y=0, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = config.fontColor or cl.White,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text or 'Err: No text given',config.autoSize)
	self.lbl = lbl

	if not inherited then
		self:postInit(self)
	end
end

function PocoUIHintLabel:makeHintPanel()
	local config = self.config
	local hintPnl

	local _reposition = function(x,y)
		if hintPnl then
			x = math.max(0,math.min(self.ppnl:w()-hintPnl:w(),x+10))
			y = math.max(self.ppnl:world_y(),math.min((me.hh or 0)-20-hintPnl:h(),y))
			hintPnl:set_world_position(x,y+20)
		end
	end
	local _buildOne = function(x,y)
		hintPnl = self.ppnl:panel{
			x = 0, y = 0, w = 800, h = 200
		}
		local __, hintLbl = _.l({
			pnl = hintPnl,x=5, y=5, font = config.hintFont or FONT, font_size = config.hintFontSize or 18, color = config.hintFontColor or cl.White,
			align = config.align, vertical = config.vAlign, layer = 2, rotation = 360
		},config.hintText or '',true)
		hintPnl:set_size(hintLbl:size())
		hintPnl:grow(10,10)
		hintPnl:rect{ color = cl.Black:with_alpha(0.7), layer = 1, rotation = 360}
		_reposition(x,y)
	end
	self:_bind(PocoEvent.In, function(self,x,y)
		if not hintPnl then
			_buildOne(x,y)
		end
	end):_bind(PocoEvent.Out, function(self,x,y)
		if hintPnl then
			if alive(hintPnl) then
				self.ppnl:remove(hintPnl)
			end
			hintPnl = nil
		end
	end):_bind(PocoEvent.Move, function(self,x,y)
		_reposition(x,y)
	end)

end


local PocoUIButton = class(PocoUIElem)
PocoHud3Class.PocoUIButton = PocoUIButton

function PocoUIButton:init(parent,config,inherited)
	self.super.init(self,parent,config,true)

	local spnl = self.pnl:panel{}
	BoxGuiObject:new(spnl, {sides = {1,1,1,1}})
	spnl:rect{color=cl.Black,alpha=0.5,layer=-1}
	spnl:set_visible(false)
	local __, lbl = _.l({
		pnl = self.pnl,x=0, y=0, w = config.w, h = config.h, font = config.font or FONT, font_size = config.fontSize or 20, color = config.fontColor or cl.White,
		align = config.align or 'center', vertical = config.vAlign or 'center'
	},config.text,config.autoSize)

	self:_bind(PocoEvent.In, function(self,x,y)
		spnl:set_visible(true)
		self:sound('slider_grab')
	end):_bind(PocoEvent.Out, function(self,x,y)
		spnl:set_visible(false)
	end)

	self.lbl = lbl
	if not inherited then
		self:postInit(self)
	end
end

local PocoUIValue = class(PocoUIElem)
PocoHud3Class.PocoUIValue = PocoUIValue
function PocoUIValue:init(parent,config,inherited)
	PocoUIElem.init(self,parent,config,true)

	local bg = self.pnl:rect{color = cl.White:with_alpha(0.1),layer=-1}
	bg:set_visible(false)
	self:_bind(PocoEvent.In, function(self,x,y)
		bg:set_visible(true)
		self:sound('slider_grab')
	end):_bind(PocoEvent.Out, function(self,x,y)
		bg:set_visible(false)
	end)

	local __, lbl = _.l({
			pnl = self.pnl,x=5, y=0, w = config.w, h = config.h, font = FONT, font_size = config.fontSize or 24,
			color = config.fontColor or cl.White },config.text,true)
	self.lbl = lbl
	self.lbl:set_center_y(config.h/2)
	local __, lbl = _.l({
			pnl = self.pnl,x=0, y=0, w = config.w, h = config.h, font = FONT, font_size = config.fontSize or 24,
			color = config.fontColor or cl.White },config.text,true)
	self.valLbl = lbl
	self.valLbl:set_center_y(config.h/2)

	if not config.noArrow then
		self.arrowLeft = self.pnl:bitmap({
			texture = 'guis/textures/menu_icons',
			texture_rect = {
				0,
				5,
				15,
				20
			},
			color = cl.White,
			x = 0,
			y = 0,
			blend_mode = 'add'
		})
		self.arrowRight = self.pnl:bitmap({
			texture = 'guis/textures/menu_icons',
			texture_rect = {
				10,
				5,
				20,
				20
			},
			color = cl.White,
			x = 20,
			y = 1,
			blend_mode = 'add',
			--rotation = 180,
		})
		self.arrowRight:set_right(config.w)
		self.arrowLeft:set_left(config.w/2)

		self.arrowLeft:set_center_y(config.h/2)
		self.arrowRight:set_center_y(config.h/2)

		local shift = function()
			return Poco._kbd:down(42) or Poco._kbd:down(54)
		end

		self:_bind(PocoEvent.Pressed,function(self,x,y)
			if self.arrowRight:inside(x,y) then
				self:next()
			elseif self.arrowLeft:inside(x,y) then
				self:prev()
			else
				self.mute = true
			end
		end):_bind(PocoEvent.Move,function(self,x,y)
			if self.arrowRight:inside(x,y) or self.arrowLeft:inside(x,y) then
				self.cursor = 'link'
			elseif shift() then
				self.cursor = 'grab'
			else
				self.cursor = 'arrow'
			end
		end):_bind(PocoEvent.WheelUp,function()
			if shift() then
				self:sound('slider_increase')
				return true, self:next()
			end
		end):_bind(PocoEvent.WheelDown,function(...)
			if shift() then
				self:sound('slider_decrease')
				return true, self:prev()
			end
		end)
	end


	-- Always inherited though
end

function PocoUIValue:next()
	self.result = false
end

function PocoUIValue:prev()
	self.result = false
end

function PocoUIValue:isValid(val)
	return true
end

function PocoUIValue:isDefault(val)
	if val == nil then
		val = self:val()
	end
	return O:isDefault(self.config.category,self.config.name,val)
end

function PocoUIValue:_markDefault(set)
	if self.config.category then
		local isChanged = O:isChanged(self.config.category,self.config.name,set)
		_.l(self.lbl,{self.config.text,self:isDefault(set) and cl.White or (isChanged and cl.LightSkyBlue or cl.DarkKhaki)})
	end
end

function PocoUIValue:val(set)
	if set ~= nil then
		if not self.value or self:isValid(set) then
			self.value = set
			_.l(self.valLbl,set,true)
			self.valLbl:set_center_x(self.config.valX or 12*self.config.w/16)
			self.valLbl:set_x(math.floor(self.valLbl:x()))
			self:_markDefault(set)
			return set
		else
			return false
		end
	else
		return self.value
	end
end

local PocoUIBoolean = class(PocoUIValue)
PocoHud3Class.PocoUIBoolean = PocoUIBoolean
function PocoUIBoolean:init(parent,config,inherited)
	config.noArrow = true
	self.super.init(self,parent,config,true)
	self.tick = self.pnl:bitmap({
		name = 'tick',
		texture = 'guis/textures/menu_tickbox',
		texture_rect = {
			0,
			0,
			24,
			24
		},
		w = 24,
		h = 24,
		color = cl.White
	})
	self.tick:set_center_y(config.h/2)

	self.lbl:set_x(self.lbl:x()+20)
	self.valLbl:set_visible(false)
	self:val(config.value or false)
	self:_bind(PocoEvent.Pressed,function(self,x,y)
		self:val(not self:val())
		self:sound('box_'..(self:val() and 'tick' or 'untick'))
		self.mute = true
	end)

	if not inherited then
		self:postInit(self)
	end
end

function PocoUIBoolean:val(set)
	if set ~= nil then
		if not self.value or self:isValid(set) then
			self.value = set
			if self.tick then
				if not set then
					self.tick:set_texture_rect(0,0,24,24)
				else
					self.tick:set_texture_rect(24,0,24,24)
				end
			end
			self:_markDefault(set)
			return set
		else
			return false
		end
	else
		return self.value
	end
end

local PocoUINumValue = class(PocoUIValue)
PocoHud3Class.PocoUINumValue = PocoUINumValue

function PocoUINumValue:init(parent,config,inherited)
	self.super.init(self,parent,config,true)
	self:val(tonumber(config.value) or 0)

	if not inherited then
		self:postInit(self)
	end
end

function PocoUINumValue:next(predict)
	local tVal = self:val()+(self.config.step or 1)
	if predict then
		return self:isValid(tVal,1)
	else
		return self:val(tVal)
	end
end

function PocoUINumValue:prev(predict)
	local tVal = self:val()-(self.config.step or 1)
	if predict then
		return self:isValid(tVal,1)
	else
		return self:val(tVal)
	end
end

function PocoUINumValue:isValid(val,silent)
	local result = (type(val) == 'number') and (val <= (self.config.max or 100)) and (val >= (self.config.min or 0))
	if not silent then
		self.result = result
	end
	return result
end

function PocoUINumValue:val(set)
	local result = PocoUIValue.val(self,set)
	if set and self.config.vanity then
		_.l(self.valLbl,self.config.vanity[self:val()+1] or self:val(),true)
		self.valLbl:set_center_x(3*self.config.w/4)
		self.valLbl:set_x(math.floor(self.valLbl:x()))
	end
	if set and self.arrowLeft then
		self.arrowLeft:set_alpha(self:prev(1) and 1 or 0.1)
		self.arrowRight:set_alpha(self:next(1) and 1 or 0.1)
	end
	return result
end

local PocoUIChooseValue = class(PocoUIValue)
PocoHud3Class.PocoUIChooseValue = PocoUIChooseValue
function PocoUIChooseValue:init(parent,config,inherited)
	PocoUIValue.init(self,parent,config,true)
	-- abstract
end

function PocoUIChooseValue:selection()
	return {}
end

function PocoUIChooseValue:go(delta)
	local val = self:val()
	local sel = self:selection()
	local keys = table.sorted_keys(sel)
	local ind = table.index_of(keys,val)
	self:val(keys[ind+delta] or delta>0 and keys[1] or keys[#keys] )
end

function PocoUIChooseValue:next()
	self:go(1)
end

function PocoUIChooseValue:prev()
	self:go(-1)
end

function PocoUIChooseValue:innerVal(set)
	if set then
		local key = table.get_key(self:selection(),set)
		if key then
			return self:val(key)
		end
	else
		return self:selection()[self:val()]
	end
end

local PocoUIBooleanValue = class(PocoUIChooseValue)
PocoHud3Class.PocoUIBooleanValue = PocoUIBooleanValue

function PocoUIBooleanValue:init(parent,config,inherited)
	PocoUIChooseValue.init(self,parent,config,true)
	self:val(isNil(config.value) and 'YES' or config.value)
	if not inherited then
		self:postInit(self)
	end
end

function PocoUIBooleanValue:selection()
	return {YES = true, NO = false}
end

local PocoUIReversedBooleanValue = class(PocoUIBooleanValue)
PocoHud3Class.PocoUIReversedBooleanValue = PocoUIReversedBooleanValue

function PocoUIReversedBooleanValue:selection()
	return {YES=true,NO=false}
end
local PocoUIColorValue = class(PocoUIChooseValue)
PocoHud3Class.PocoUIColorValue = PocoUIColorValue
function PocoUIColorValue:init(parent,config,inherited)
	self.super.init(self,parent,config,true)
	self:val(config.value or 'White')

	if not inherited then
		self:postInit(self)
	end
end

function PocoUIColorValue:selection()
	return cl
end

function PocoUIColorValue:val(set)
	local val = PocoUIValue.val(self,set)
	if set then
		local color = cl[val] or cl.White
		_.l(self.valLbl,{val,color})
	end
	return val
end

local PocoUIKeyValue = class(PocoUIValue)
PocoHud3Class.PocoUIKeyValue = PocoUIKeyValue
function PocoUIKeyValue:init(parent,config,inherited)
	config.noArrow = true
	self.super.init(self,parent,config,true)
	self:val(config.value or '')
	self:_bind(PocoEvent.Pressed,function(self,x,y)
		self.mute = true
		if self._waiting then
			self:sound('menu_error')
			self:cancel()
		else
			self:sound('prompt_enter')
			self:setup()
		end
	end):_bind(PocoEvent.Click,function(self,x,y)
		if not self:inside(x,y) then
			self:sound('menu_error')
			self:cancel()
		end
	end)

	if not inherited then
		self:postInit(self)
	end
end

function PocoUIKeyValue:setup()
	self._waiting = true
	me._focused = self
	me._ws:connect_keyboard(Input:keyboard())
	local onKeyPress = function(o, key)
		me._stringFocused = now()
		local keyName = Input:keyboard():button_name_str(key)
		if key == Idstring('backspace') then
			self:sound('menu_error')
			self:val('')
			self:cancel()
			return
		end
		local ignore = ('enter,space,esc,num abnt c1,num abnt c2,@,ax,convert,kana,kanji,no convert,oem 102,stop,unlabeled,yen,mouse 8,mouse 9'):split(',')
		for __,iKey in pairs(ignore) do
			if key == Idstring(iKey) then
				if iKey ~= 'esc' then
					managers.menu:show_key_binding_forbidden({KEY = keyName})
				end
				self:sound('menu_error')
				self:cancel()
				return
			end
		end
		self:sound('menu_skill_investment')
		self:val(keyName)
		self:cancel()
	end
	_.l(self.valLbl,'_',true)
	self.valLbl:key_press(onKeyPress)
end

function PocoUIKeyValue:cancel()
	self._waiting = nil
	me._ws:disconnect_keyboard()
	me._focused = nil
	self.valLbl:key_press(nil)
	self:val(self:val())
end

function PocoUIKeyValue:val(set)
	local val = PocoUIValue.val(self,set)
	if set then
		if set == '' then
			set = {'NONE',cl.Silver}
		else
			set = set:upper()
		end
		_.l(self.valLbl,set,true)
	end
	return val
end


local PocoUIStringValue = class(PocoUIValue)
PocoHud3Class.PocoUIStringValue = PocoUIStringValue

function PocoUIStringValue:init(parent,config,inherited)
	config.noArrow = true
	self.super.init(self,parent,config,true)
	self:_initLayout()
	self:val(config.value or '')
	self.box = self.pnl:rect{color = cl.White:with_alpha(0.3), visible = false}
	self:_bind(PocoEvent.Pressed,function(self,x,y)
		if not self._editing then
			self:startEdit()
			self:selectAll()
		else
			if now() - (self._lastClick or 0) < 0.3 then
				self:selectAll()
			elseif self.valLbl:inside(x,y) then
				self:_setCaret(x)
			else
				self:endEdit()
			end
		end
		self._lastClick = now()
	end):_bind(PocoEvent.WheelUp,self.next):_bind(PocoEvent.WheelDown,self.prev):_bind(PocoEvent.Click,function(self,x,y)
		if not self:inside(x,y) then
			self:endEdit()
		end
	end)

	if not inherited then
		self:postInit(self)
	end
end

function PocoUIStringValue:_initLayout()
	if not self.config.valX and self.config.text:gsub(' ','') == '' then
		self.config.valX = self.config.w / 2
	end
end

function PocoUIStringValue:val(set)
	if set then
		set = utf8.sub(set,1,self.config.max or 15)
	end
	local result =  PocoUIValue.val(self,set)
	self:repaint()
	return result
end

function PocoUIStringValue:startEdit()
	self._editing = true
	self.box:set_visible(true)
	me._ws:connect_keyboard(Input:keyboard())
	me._focused = self
	self.pnl:enter_text(callback(self, self, 'enter_text'))
	self.pnl:key_press(callback(self, self, 'key_press'))
	self.pnl:key_release(callback(self, self, 'key_release'))
	local l = utf8.len(self:val())
	self.valLbl:set_selection(l,l)
	self._rename_caret = self.pnl:rect({
		name = 'caret',
		layer = -1,
		x = 10,
		y = 10,
		w = 2,
		h = 2,
		color = cl.Red
	})
	self:repaint()
	self._rename_caret:animate(self.blink)
	self.beforeVal = self:val()
end

function PocoUIStringValue:selectAll()
	self:_select(0, utf8.len(self:val()))
	self._start = 0
	self._shift = nil
	self:repaint()
end

function PocoUIStringValue:_select(tS,tE)
	local s,e = self.valLbl:selection()
	local l = utf8.len(self:val())
	if tS and tE then
		s, e = math.max(0,tS),math.min(tE,l)
		if s == e then
			self._start = s
		end
		self.valLbl:set_selection(s,e)
	else
		return s,e
	end
end
function PocoUIStringValue:select(delta,shift)
	local s, e = self:_select()
	if shift then -- start Shift
		self._start = s
		self._shift = true
	elseif shift == false then
		self._shift = nil
	elseif self._shift then -- grow selection
		local ss = self._start
		if delta > 0 then
			if ss == s then
				self:_select(ss,e+delta)
			else
				self:_select(s+delta,ss)
			end
		elseif delta < 0 then
			if ss == e then
				self:_select(s+delta,ss)
			else
				self:_select(ss,e+delta)
			end
		end
	else -- simpleMove
		self:_select(s+delta,s+delta)
	end

end

function PocoUIStringValue:_setCaret(worldX)
	local lbl = self.valLbl
	local l = utf8.len(self:val())
	if l == 0 then
		self:select(0,0)
	end
	local c, x, y, w, h = -1
	repeat
		c = c + 1
		self:_select(c,c)
		x, y, w, h = self.valLbl:selection_rect()
	until x>=worldX or c > l
	self:_select(c-1,c-1)
	self:repaint()
end

function PocoUIStringValue:endEdit(cancel)
	self._editing = nil
	me._focused = nil
	self.box:set_visible(false)
	me._ws:disconnect_keyboard()
	self:_select(0,0)
	self.pnl:enter_text(nil)
	self.pnl:key_press(nil)
	self.pnl:key_release(nil)
	self.pnl:remove(self._rename_caret)
	self._rename_caret = nil
	if cancel then
		self:val(self.beforeVal)
	end
	self.beforeVal = nil
end

function PocoUIStringValue:repaint()
	me._stringFocused = now()
	if self.box then
		local x,y,w,h = self.valLbl:shape()
		x, y, w, h = x-5, y-5, w+10, math.max(h+10,self.config.h+10)
		self.box:set_shape(x,y,w,h)
	end
	if self._rename_caret then
		local x, y, w, h = self.valLbl:selection_rect()
		if x == 0 then
			x,y = self.valLbl:world_position()
		end
		w = math.max(w,3)
		h = math.max(h,20)
		self._rename_caret:set_world_shape(x,y,w,h)
	end
end

function PocoUIStringValue.blink(o)
	while alive(o) do
		o:set_color(cl.White:with_alpha(0.1))
		wait(0.2)
		o:set_color(cl.White:with_alpha(0.5))
		wait(0.3)
	end
end
function PocoUIStringValue:enter_text(o, s)
	if self._editing then
		self.valLbl:replace_text(s)
		self:val(self.valLbl:text())
	end
end

function PocoUIStringValue:key_release(o, k)
	if k == Idstring('left shift') or k == Idstring('right shift') then
		self:select(0,false)
	elseif k == Idstring('left ctrl') or k == Idstring('right ctrl') then
		self._key_ctrl_pressed = false
	end
end

function PocoUIStringValue:key_press(o, k)
	if managers.menu:active_menu() then
		managers.menu:active_menu().renderer:disable_input(0.2)
	end
	local lbl = self.valLbl
	local n = utf8.len(lbl:text())
	local s, e = lbl:selection()
	if k == Idstring('delete') then
		if s == e and s > 0 then
			lbl:set_selection(s, e+1)
		end
		self:enter_text('')
	elseif k == Idstring('backspace') then
		if s == e and s > 0 then
			lbl:set_selection(s - 1, e)
		end
		self:enter_text('')
	elseif k == Idstring('left') then
		self:select(-1)
		--[[
		if s < e then
			lbl:set_selection(s, s)
		elseif s > 0 then
			lbl:set_selection(s - 1, s - 1)
		end]]

	elseif k == Idstring('right') then
		self:select(1)
		--[[
		if s < e then
			lbl:set_selection(e, e)
		elseif s < n then
			lbl:set_selection(s + 1, s + 1)
		end]]
	elseif k == Idstring('end') then
		lbl:set_selection(n, n)
	elseif k == Idstring('home') then
		lbl:set_selection(0, 0)
	elseif k == Idstring('enter') or k == Idstring('tab') then
		self:endEdit()
	elseif k == Idstring('esc') then
		self:endEdit(true)
		return
	elseif k == Idstring('left shift') or k == Idstring('right shift') then
		self:select(0,true)
	elseif k == Idstring('left ctrl') or k == Idstring('right ctrl') then
		self._key_ctrl_pressed = true
	elseif self._key_ctrl_pressed == true then
		return
	end
	self:repaint()
end


local PocoScrollBox = class(PocoUIElem)
PocoHud3Class.PocoScrollBox = PocoScrollBox
function PocoScrollBox:init(parent,config,inherited)
	self.parent = parent
	self.config = config
	self.wrapper = config.pnl:panel(config)
	self.pnl = self.wrapper:panel{ x=0, y=0, w =self.wrapper:w(), h = self.wrapper:h(), name = 'content'}
	local m,sW = 10,4
	local sH = self.wrapper:h()-(2*m)
	local _matchScroll = function()
		local pH,wH = self.pnl:h(), self.wrapper:h()
		self.sPnl:set_y(m-self.pnl:y()*wH/pH)
		self.sPnl:set_h(self.wrapper:h()/self.pnl:h() * sH - m)
	end
	self._matchScroll = _matchScroll
	self.sPnl = self.wrapper:panel{ x=self.wrapper:w()-sW-m/2, y=m, w =sW, h = sH, name = 'scroll', visible = false}
	BoxGuiObject:new(self.sPnl, { sides = {2,2,0,0} }):set_aligns('scale', 'scale')
	self.sPnl:stop()
	self.sPnl:animate(function(p)
		while alive(p) do
			if p:visible() then
				local a = math.max(0.05,0.3-now()+(self._t or 0))*4
				if a ~= self._a then
					p:set_alpha(a)
					self._a = a
				end
			end
			coroutine.yield()
		end
	end)

	self.pnl:stop()
	self.pnl:animate(function(panel)
		while alive(panel) do
			if panel:visible() then
				local tY,cY = math.floor(self.y or 0),math.floor(panel:y())
				local rY = math.floor(cY + ((tY-cY)/5))
				if tY~=rY then
					if math.abs(tY - rY)<5 then
						rY = tY
					end
					rY = math.floor(rY + 1)
					self._t = now()
					panel:set_y(rY)
					_matchScroll()
				end
			end
			coroutine.yield()
		end
	end)

	local scrollStep = 60
	self:_bind(PocoEvent.WheelUp,function(_self,x,y)
		if not shift() and self:canScroll(false,x,y) then
			return true, self:scroll(scrollStep)
		end
	end):_bind(PocoEvent.WheelDown,function(_self,x,y)
		if not shift() and self:canScroll(true,x,y) then
			return true, self:scroll(-scrollStep)
		end
	end)
	if not inherited then
		self:postInit(self)
	end
end

function PocoScrollBox:set_h(_h)
	self.pnl:set_h(math.max(self.wrapper:h(),_h))
	if self.pnl:h() > self.wrapper:h() then
		self.sPnl:set_visible(true)
	else
		self.sPnl:set_visible(false)
		self:scroll(0,true)
	end
	self:_matchScroll()
end

function PocoScrollBox:isLarge()
	return self.pnl:h() > self.wrapper:h()
end

function PocoScrollBox:canScroll(down,x,y)
	local result = self:isLarge() and self.wrapper:inside(x,y) and self
	if (self._errCnt or 0) > 1 then
		local pos = self.y or 0
		if (pos == 0) ~= down then
			result = false
		end
	end
	return result
end

function PocoScrollBox:scroll(val,force)
	local tVal = force and 0 or (self.y or 0) + val
	local pVal = math.clamp(tVal,self.wrapper:h()-self.pnl:h()-20,0)
	if pVal ~= tVal then
		self._errCnt = 1+ (self._errCnt or 0)
	else
		self._errCnt = 0
		if not force then
			managers.menu:post_event(val>0 and 'slider_increase' or 'slider_decrease')
		end
	end
	self.y = pVal
end

local PocoTab = class()
PocoHud3Class.PocoTab = PocoTab

function PocoTab:init(parent,ppnl,tabName)
	self.parent = parent -- tabs
	self.ppnl = ppnl
	self.name = tabName
	self.hotZones = {}
	self.box = PocoScrollBox:new(self,{ pnl = ppnl, x=0, y=parent.config.th,w = ppnl:w(), h = ppnl:h()-parent.config.th, name = tabName})
	self.pnl = self.box.pnl

end

function PocoTab:insideTabHeader(x,y,noChildren)
	local result = self.bg and alive(self.bg) and self.bg:inside(x, y) and self
	if not result and not noChildren then
		if self._children then
			for name,child in pairs(self._children) do
				if child.currentTab and child.currentTab:insideTabHeader(x,y) then
					return child,false
				end
			end
		end
	end
	return result,true
end

function PocoTab:addHotZone(event,item)
	self.hotZones[event] = self.hotZones[event] or {}
	table.insert(self.hotZones[event],item)
end

function PocoTab:isHot(event, x, y, autoFire)
	if self.hotZones[event] and alive(self.pnl) and self.box.wrapper:inside(x,y) then
		for i,hotZone in pairs(self.hotZones[event]) do
			if hotZone:isHot(event, x,y) then
				if autoFire then
					local r = hotZone:fire(event, x, y)
					if r then
						return r
					end
				else
					return hotZone
				end
			end
		end
	end
	if self._children then
		for name,child in pairs(self._children) do
			local cResult = child.currentTab and child.currentTab:isHot(event,x,y,autoFire)
			if cResult then return cResult end
		end
	end
	return false
end

function PocoTab:scroll(val, force)
	return self.box:scroll(val,force)
--	return self.pnl:set_y(pVal)
end

function PocoTab:canScroll(down,x,y)
	return self.box:canScroll(down,x,y)
end

function PocoTab:set_h(h)
	self.box:set_h(h)
end

function PocoTab:children(child)
	if child then
		local children = self._children or {}
		children[#children+1] = child
		self._children = children
	end
end

function PocoTab:destroy()
	self.dead = true
	for name,child in pairs(self._children or {}) do
		child:destroy()
	end
end

local PocoTabs = class()
PocoHud3Class.PocoTabs = PocoTabs

function PocoTabs:init(ws,config) -- name,x,y,w,th,h,alt
	self._ws = ws
	config.fontSize = config.fontSize or 20
	self.config = config
	self.pTab = config.pTab
	if self.pTab then
		self.pTab:children(self)
	end
	self.alt = config.alt
	self.pnl = (self.pTab and self.pTab.pnl or ws:panel()):panel{ name = config.name , x = config.x, y = config.y, w = config.w, h = config.h, layer = self.pTab and 0 or Layers.TabHeader}
	self.items = {} -- array of PocoTab
	self._children = {} -- array of PocoTabs
	self.sPnl = self.pnl:panel{ name = config.name , x = 0, y = config.th, w = config.w, h = config.h-config.th}
	if not self.alt then
		BoxGuiObject:new(self.sPnl, {
			sides = {
				1,
				1,
				2,
				1
			}
		})
	end
end

function PocoTabs:canScroll(down,x,y)
	local cTC = self.currentTab and self.currentTab._children
	if cTC then
		for ind,tabs in pairs(cTC) do
			local cResult = {tabs:canScroll(down,x,y)}
			if cResult[1] then
				return unpack(cResult)
			end
		end
	end
	if self.currentTab then
		return self.currentTab:canScroll(down,x,y)
	end
end

function PocoTabs:insideTabHeader(x,y,noChildren)
	for ind,tab in pairs(self.items) do
		local tResult = {tab:insideTabHeader(x,y,true)}
		if tResult[1] and self.tabIndex ~= ind then
			return self, ind
		end
	end
	local cTC = self.currentTab and self.currentTab._children
	if cTC then
		for ind,tabs in pairs(cTC) do
			local cResult = {tabs:insideTabHeader(x,y)}
			if cResult[1] then
				return unpack(cResult)
			end
		end
	end

	local dY = y-self.pnl:world_y()
	if dY>0 and self.config.th >= dY then
		if self.currentTab then
			return self, 0
		end
	end
end

function PocoTabs:goTo(index)
	local cnt = #self.items
	if index < 1 then
		index = cnt
	elseif index > cnt then
		index = 1
	end
	if index ~= self.tabIndex then
		managers.menu:post_event('slider_release' or 'Play_star_hit')
		self.tabIndex = index
		self:repaint()
	end
end
function PocoTabs:move(delta)
	self:goTo((self.tabIndex or 1) + delta)
end
function PocoTabs:add(tabName)
	local item = PocoTab:new(self,self.pnl,tabName)
	table.insert(self.items,item)
	self.tabIndex = self.tabIndex or 1
	self:repaint()
	return item
end

function PocoTabs:repaint()
	local cnt = #self.items
	local x = 0
	if cnt == 0 then return end
	local tabIndex = self.tabIndex or 1
	for key,itm in pairs(self.items) do
		local isSelected = key == tabIndex
		if isSelected then
			self.currentTab = itm
		end
		local hPnl = self.pnl:panel{w = 200, h = self.config.th, x = x, y = 0}
		if itm.hPnl then
			self.pnl:remove(itm.hPnl)
		end
		if not self.alt then
			local bg = hPnl:bitmap({
				name = 'tab_top',
				texture = 'guis/textures/pd2/shared_tab_box',
				w = self.config.w, h = self.config.th + 3,
				color = cl.White:with_alpha(isSelected and 1 or 0.1)
			})
			local lbl = hPnl:text({
				x = 10, y = 0, w = 200, h = self.config.th,
				name = 'tab_name', text = itm.name,
				font = FONT,
				font_size = self.config.fontSize,
				color = isSelected and cl.Black or cl.White,
				layer = 1,
				align = 'center',
				vertical = 'center'
			})
			local xx,yy,w,h = lbl:text_rect()

			lbl:set_size(w,self.config.th)

			bg:set_w(w + 20)
			x = x + w + 22
			itm.bg = bg
		end
		itm.hPnl = hPnl
		if itm.box then
			itm.box.wrapper:set_visible(isSelected)
		end
		itm.pnl:set_visible(isSelected)
	end
	if self.currentTab then
		self.currentTab:scroll(0,true)
	end
end

function PocoTabs:destroy(ws)
	for k,v in pairs(self.items) do
		v:destroy()
	end
	self._ws:panel():remove(self.pnl)
end
------------
local PocoMenu = class()
PocoHud3Class.PocoMenu = PocoMenu
function PocoMenu:init(ws,alternative)
	self._ws = ws
	self.alt = alternative
	if alternative then
		self.pnl = ws:panel():panel({ name = 'bg' })
		self.gui = PocoTabs:new(ws,{name = 'PocoRose',x = 0, y = -1, w = ws:width(), th = 1, h = ws:height()+1, pTab = nil, alt = true})

	else
		self.gui = PocoTabs:new(ws,{name = 'PocoMenu',x = 10, y = 10, w = 1000, th = 30, h = ws:height()-20, pTab = nil})

		self.pnl = ws:panel():panel({ name = 'bg' })
		self.pnl:rect{color = cl.Black:with_alpha(0.7),layer = Layers.Bg}
		self.pnl:bitmap({
			layer = Layers.Blur,
			texture = 'guis/textures/test_blur_df',
			w = self.pnl:w(),h = self.pnl:h(),
			render_template = 'VertexColorTexturedBlur3D'
		})
		local __, lbl = _.l({pnl = self.pnl,x = 1010, y = 20, font = FONT, font_size = 17, layer = Layers.TabHeader},
			{'Bksp or Dbl-right-click to dismiss',cl.Gray},true)
		lbl:set_right(1000)
	end

	PocoMenu.m_id = PocoMenu.m_id or managers.mouse_pointer:get_id()
	managers.mouse_pointer:use_mouse{
		id = PocoMenu.m_id,
		mouse_move = callback(self, self, 'mouse_moved',true),
		mouse_press = callback(self, self, 'mouse_pressed',true),
		mouse_release = callback(self, self, 'mouse_released',true)
	}

	self._lastMove = 0
end

function PocoMenu:_fade(pnl, out, done_cb, seconds)
	local pnl = self.pnl
	pnl:set_visible( true )
	pnl:set_alpha( out and 1 or 0 )
	local t = seconds
	if self.alt and not out then
		managers.mouse_pointer:set_mouse_world_position(pnl:w()/2, pnl:h()/2)
	end
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local r = t/seconds
		pnl:set_alpha(out and r or 1-r)
		if self._tabs then
			for i,tabs in pairs(self._tabs) do
				tabs.pnl:set_alpha(out and r or 1-r)
			end
		end
		if self.gui and self.gui.pnl then
			self.gui.pnl:set_alpha(out and r or 1-r)
		end
	end
	if done_cb then
		done_cb()
	end
end


function PocoMenu:fadeIn()
	self.pnl:stop()
	self.pnl:animate( callback( self, self, '_fade' ), false, nil, self.alt and 0.1 or 0.25 )
end
function PocoMenu:fadeOut(cbk)
	self.pnl:stop()
	self.pnl:animate( callback( self, self, '_fade' ), true, cbk, self.alt and 0.1 or 0.25 )
end



function PocoMenu:add(...)
	self._tabs = self._tabs or {}
	local newTabs = self.gui:add(...)
	table.insert(self._tabs,newTabs)
	return newTabs
end

function PocoMenu:update(...)
end

function PocoMenu:destroy()
	if self.dead then return end
	self.dead = true
	if PocoMenu.m_id then
		managers.mouse_pointer:remove_mouse(PocoMenu.m_id)
	end

	if self.gui then
		self.gui:destroy()
	end
	if self.pnl then
		self._ws:panel():remove(self.pnl)
	end

end

function PocoMenu:mouse_moved(alt, panel, x, y)
	if not me or me.dead then return end
	local ret = function (a,b)
		if alt then
			managers.mouse_pointer:set_pointer_image(b)
		end
		return a, b
	end
	if self.dead then return end
	--if not inGame and alt then return end
	local isNewPos = self._x ~= x or self._y ~= y
	if isNewPos then
		self._close = nil
	else
		return
	end
	self._x = x
	self._y = y
	local _fireMouseOut = function()
		if self.lastHot then
			self.lastHot:fire(PocoEvent.Out,x,y)
			self.lastHot = nil
		end
	end
	local currentTab = self.gui and self.gui.currentTab

	local hotElem = isNewPos and currentTab and currentTab:isHot(PocoEvent.Move, x,y)
	if hotElem then
		hotElem:fire(PocoEvent.Move,x,y)
	end

	local hotElem = isNewPos and currentTab and currentTab:isHot(PocoEvent.In, x,y)
	if hotElem then
		if hotElem ~= self.lastHot then
			_fireMouseOut()
			self.lastHot = hotElem
			hotElem:fire(PocoEvent.In,x,y)
		end
	elseif isNewPos then
		_fireMouseOut()
	end
	local hotElem = currentTab and currentTab:isHot(PocoEvent.Pressed, x,y)
	if hotElem then
		return ret(true, hotElem.cursor or 'link')
	end
	if self.gui then
		local tabHdr = {self.gui:insideTabHeader(x,y)}
		if isNewPos and tabHdr[1] then
			return ret(true, tabHdr[2]~=0 and 'link' or 'arrow')
		end
	end
	return ret( true, 'arrow' )
end

function PocoMenu:mouse_pressed(alt, panel, button, x, y)
	if not me or me.dead then return end
	if self.dead then return end
	if self.alt then return end
	pcall(function()
		local currentTab = self.gui and self.gui.currentTab
		if button == Idstring('mouse wheel down') then
			if currentTab:isHot(PocoEvent.WheelDown, x,y, true) then
				return true
			end
			local tabHdr = {self.gui:insideTabHeader(x,y)}
			if tabHdr[1] and now() - self._lastMove > 0.05 then
				self._lastMove = now()
				tabHdr[1]:move(1)
			end
		elseif button == Idstring('mouse wheel up') then
			if currentTab:isHot(PocoEvent.WheelUp, x,y, true) then
				return true
			end
			local tabHdr = {self.gui:insideTabHeader(x,y)}
			if tabHdr[1] and now() - self._lastMove > 0.05 then
				self._lastMove = now()
				tabHdr[1]:move(-1)
			end
		end

		if button == Idstring('0') then
			local focused = me._focused
			if focused and not focused:inside(x,y) then
				focused:fire(PocoEvent.Click,x,y)
				me._focused = nil
			end
			local tabs, tabInd = self.gui:insideTabHeader(x,y)
			if tabs and self.tabIndex ~= tabInd then
				if tabInd == 0 then
					tabs.currentTab:scroll(0,true)
				else
					tabs:goTo(tabInd)
				end
				return true
			end
			return currentTab and currentTab:isHot(PocoEvent.Pressed, x,y, true)
		end
		if button == Idstring('1') then
			return currentTab and currentTab:isHot(PocoEvent.PressedAlt, x,y, true)
		end
	end)
end

function PocoMenu:mouse_released(alt, panel, button, x, y)
	if not me or me.dead then return end
	if self.dead then return end
	if self.alt then return end
	local currentTab = self.gui and self.gui.currentTab
	if button == Idstring('0') then
		return currentTab and currentTab:isHot(PocoEvent.Released, x,y, true)
	end
	if button == Idstring('1') then
		local hot = currentTab and currentTab:isHot(PocoEvent.ReleasedAlt, x,y, true)
		if not hot then
			if self._close then
				me:Menu(true)
			else
				self._close = true
			end
		end
		return hot
	end
end

------------------------------
--- PocoHud3:Menu functions
------------------------------
local titlecase = function (str)
		local buf = {}
		for word in string.gfind(str, '%S+') do
				local first, rest = string.sub(word, 1, 1), string.sub(word, 2)
				table.insert(buf, string.upper(first) .. string.lower(rest))
		end
		return table.concat(buf, ' ')
end

function PocoHud3Class._drawHeistStats (tab)
	local oTabs = PocoTabs:new(me._ws,{name = 'Options',x = 10, y = 10, w = 950, th = 30, fontSize = 18, h = tab.pnl:height()-20, pTab = tab})
	local oTab = oTabs:add('Heist')
	local pnl = oTab.pnl
	local w, h, ww, hh = 0,0, pnl:size()
	local font,fontSize = tweak_data.menu.pd2_small_font, tweak_data.menu.pd2_small_font_size*0.98
	local _rowCnt = 0

	local host_list, level_list, job_list, mask_list, weapon_list = tweak_data.achievement.job_list, managers.statistics:_get_stat_tables()
	local risks = { 'risk_pd', 'risk_swat', 'risk_fbi', 'risk_death_squad', 'risk_murder_squad'}
	local x, y, tbl = 10, 10, {}
	tbl[#tbl+1] = {{'Broker',cl.BlanchedAlmond},'Job',{Icon.Skull,cl.PaleGreen:with_alpha(0.3)},{Icon.Skull,cl.PaleGoldenrod},{Icon.Skull..Icon.Skull,cl.LavenderBlush},{string.rep(Icon.Skull,3),cl.Wheat},{string.rep(Icon.Skull,4),cl.Tomato},'Heat'}
	local addJob = function(host,heist)
		local jobData = tweak_data.narrative.jobs[heist]
		if jobData.wrapped_to_job then
			jobData = tweak_data.narrative.jobs[jobData.wrapped_to_job]
		end
		local job_string =managers.localization:to_upper_text(jobData.name_id or heist) or heist
		local pro = jobData.professional
		if pro then
			job_string = {job_string, cl.Red}
		end
		local rowObj = {host:upper(),job_string}
		for i, name in ipairs( risks ) do
			local c = managers.statistics:completed_job( heist, tweak_data:index_to_difficulty( i + 1 ) )
			local f = managers.statistics._global.sessions.jobs[heist .. '_' .. tweak_data:index_to_difficulty( i + 1 ) .. '_started'] or 0
			if i > 1 or not pro then
				table.insert(rowObj, {{c, c<1 and cl.Salmon or cl.White:with_alpha(0.8)},{' / '..f,cl.White:with_alpha(0.4)}})
			else
				table.insert(rowObj, {c > 0 and c or 'N/A', cl.Tan:with_alpha(0.4)})
			end
		end
		local multi = managers.job:get_job_heat_multipliers(heist)
		local color = multi >= 1 and math.lerp( cl.Khaki, cl.Chartreuse, 2*(multi - 1) ) or math.lerp( cl.Crimson, cl.OrangeRed, multi )
		table.insert(rowObj,{{_.f(multi*100,5)..'%',color},{' ('..managers.job:get_job_heat(heist)..')',color:with_alpha(0.3)}})
		tbl[#tbl+1] = rowObj
	end
	for host,jobs in pairs(host_list) do
		for no,heist in _pairs(jobs) do
			job_list[table.get_key(job_list,heist)] = nil
			addJob(host,heist)
		end
	end
	for no,heist in pairs(job_list) do
		addJob('N/A',heist) -- Just in case
	end
	local _lastHost = ''
	for row, _tbl in pairs(tbl) do
		if _lastHost == _tbl[1] then
			_tbl[1] = ''
		else
			_lastHost = _tbl[1]
		end
		_rowCnt = _rowCnt + 1
		y = me:_drawRow(pnl,fontSize,_tbl,x,y,ww-20, _rowCnt % 2 == 0,{1,_rowCnt == 1 and 1 or 0})
	end
	oTab:set_h(y)
end

function PocoHud3Class._drawUpgrades (tab, data, isTeam, desc, offsetY)
	local _ignore = {}
	local pnl = tab.pnl
	offsetY = offsetY or 0
	pnl:text{
		x = 10, y = offsetY+10, w = 600, h = 30,
		name = 'tab_desc', text = Icon.Chapter..' '..desc,
		font = FONTLARGE, font_size = 25, color = cl.CornFlowerBlue,
	}
	local large = 5
	local y,fontSize,w = offsetY+35, 19, pnl:w()
	if data then
		local merged = table.deepcopy(data)
		for category, upgrades in _pairs(merged) do
			local row,cnt = {},0
			y = me:_drawRow(pnl,fontSize*1.1,{{titlecase(category:gsub('_',' ')),cl.Peru},''},5,y,w)
			for name,value in _pairs(upgrades) do
				local isMulti = name:find('multiplier') or name:find('_chance') or name:find('_mul')
				local val = isTeam and managers.player:team_upgrade_value(category, name, 1) or managers.player:upgrade_value(category, name, 1)
				if not (isMulti and val == 1) then
					cnt = cnt + 1
					if isMulti and type(val) == 'number' then
						val = _.s(val*100) .. '%'
					elseif type(val) == 'table' then
						val = _.s( type(val[1]) == 'number' and _.s(val[1]*100) .. '%' or _.s(val[1]==true and 'Yes' or val[1]), _.s(val[2],'sec') )
					elseif val == true then
						val = 'Yes'
					else
						val = _.s(val)
					end
					row[#row+1] = {
						{(name:gsub('_multiplier',''):gsub('_',' '))..' ',cl.WhiteSmoke}
					}
					row[#row+1] = {
						{val..' ',cl.LightSteelBlue}
					}

					if #row> large then
						y = me:_drawRow(pnl,fontSize,row,15,y,w,true,{0,1,0,1,0,1})
						row = {}
					end
				end
			end
			if cnt == 0 then
				row[#row+1] =  {'Not effective',cl.LightSteelBlue}
			end
			if #row > 0 then
				while (#row <= large) do
					table.insert(row,'')
				end
				y = me:_drawRow(pnl,fontSize,row,15,y,w,true,{0,1,0,1,0,1})
				row = {}
			end
		end
		tab:set_h(y)
	else
		y = me:_drawRow(pnl,fontSize,{{'No upgrades acquired\n',cl.White:with_alpha(0.5)}},0,y,w)
	end
	return y
end

function PocoHud3Class._drawPlayer(pnl, pid, member, offsetY)
	offsetY = offsetY or 0
	pnl:text{
		x = 10, y = offsetY+10, w = 600, h = 30,
		name = 'tab_desc', text = me:_name(pid),
		font = FONTLARGE, font_size = 25, color = me:_color(pid)
	}
	local y,fontSize,w = offsetY+35, 19, 970
	return y
end

function PocoHud3Class._drawAbout(tab,REV,TAG)
end

function PocoHud3Class._drawOptions(tab)
	local self = me
	local objs = {}
	self.onMenuDismiss = function()
		O:default()
		for __,obj in pairs(objs) do
			if not obj[1]:isDefault() then
				O:set(obj[2],obj[3],obj[1]:val())
			end
		end
		O:save()
		me:Menu(true)
	end
	PocoUIButton:new(tab,{
		onClick = function()
			me:Menu(true,true)
			PocoHud3Class.TPocoHud3.Toggle()
			PocoHud3 = nil -- will reload on its own
		end,
		x = 20, y = 10, w = 400, h=50,
		fontSize = 30,font = FONTLARGE,
		text={'APPLY & RELOAD',cl.SteelBlue},
		hintText = 'Some options will be applied on the next session.'
	})

	PocoUIButton:new(tab,{
		onClick = function()
			for __,obj in pairs(objs) do
				obj[1]:val(O:get(obj[2],obj[3],true))
			end
		end,
		x = 500, y = 10, w = 200, h=50,
		fontSize = 25,font = FONTLARGE,
		text={'DISCARD CHANGES',cl.Gray},
		hintText = 'Discard temporary changes and revert to previous settings'
	})
	PocoUIButton:new(tab,{
		onClick = function()
			for __,obj in pairs(objs) do
				obj[1]:val(O:_default(obj[2],obj[3]))
			end
		end,
		x = 710, y = 10, w = 200, h=50,
		fontSize = 25,font = FONTLARGE,
		text={'RESET TO DEFAULT',cl.Gray},
		hintText = 'Revert to the default setting.'
	})

	local oTabs = PocoTabs:new(self._ws,{name = 'Options',x = 10, y = 70, w = 960, th = 30, fontSize = 18, h = tab.pnl:height()-90, pTab = tab})
	for category, objects in _pairs(O.scheme) do
		local _y, m, half = 10, 5
		local x,y = function()
			return half and 440 or 10
		end, function(h)
			_y = _y + h + m
			return _y - h - m
		end
		local oTab = oTabs:add(category:gsub('(%U)(%u)','%1 %2'):upper())
		if objects[1] then
			local txts = objects[1]
			local __, lbl = _.l({font=FONT, color=cl.LightSteelBlue, alpha=0.9, font_size=20, pnl = oTab.pnl, x = x(), y = y(0)},txts,true)
			y(lbl:h())
			--[[oTab.pnl:bitmap({
				texture = 'guis/textures/pd2/shared_lines',	wrap_mode = 'wrap',
				color = cl.White, x = 5, y = y(3), w = oTab.pnl:w()-10, h = 3, alpha = 0.3 })]]
		end

		local c = 0
		local _sy,_ty = _y
		for name,values in _pairs(objects,function(a,b)
			local t1, t2 = O:_type(category,a),O:_type(category,b)
			local s1, s2 = O:_sort(category,a) or 99,O:_sort(category,b) or 99
			if a == 'enable' then
				return true
			elseif b == 'enable' then
				return  false
			elseif s1 ~= s2 and type(s1) == type(s2) then
				return s1 < s2
			elseif t1 == 'bool' and t2 ~= 'bool' then
				return true
			elseif t1 ~= 'bool' and t2 == 'bool' then
				return false
			end
			return tostring(a) < tostring(b)
		end) do
			if type(name) ~= 'number' then
				c = c + 1
				if not half and c > table.size(objects) / 2 then
					half = true
					_ty = _y
					_y = _sy
				end
				local type = O:_type(category,name)
				local value = O:get(category,name,true)
				local hint = O:_hint(category,name)
				local tName = name:gsub('(%U)(%u)','%1 %2'):upper()
				if type == 'bool' then
					objs[#objs+1] = {PocoUIBoolean:new(oTab,{
						x = x()+10, y = y(30), w=390, h=30, category = category, name = name,
						fontSize = 20, text=tName , value = value ,
						hintText = hint
					}),category,name}
				elseif type == 'color' then
					objs[#objs+1] = {PocoUIColorValue:new(oTab,{
						x = x()+10, y = y(30), w=390, h=30, category = category, name = name,
						fontSize = 20, text=tName, value = value,
						hintText = hint
					}),category,name}
				elseif type == 'key' then
					objs[#objs+1] = {PocoUIKeyValue:new(oTab,{
						x = x()+10, y = y(30), w=390, h=30, category = category, name = name,
						fontSize = 20, text=tName, value = value,
						hintText = hint
					}),category,name}
				elseif type == 'num' then
					local range = O:_range(category,name) or {}
					local vanity = O:_vanity(category,name)
					local step = O:_step(category,name)

					objs[#objs+1] = {PocoUINumValue:new(oTab,{
						x = x()+10, y = y(30), w=390, h=30, category = category, name = name, step = step,
						fontSize = 20, text=tName, value = value, min = range[1], max = range[2], vanity = vanity,
						hintText = hint
					}),category,name}
				else
					PocoUIButton:new(oTab,{
						hintText = 'Not implemented for now.',
						x = x()+10, y = y(30), w=390, h=30,
						text=_.s(name,type,value)
					})
				end
			end
		end
		oTab:set_h(math.max(_y,_ty)+40)
	end
end

function PocoHud3Class._drawRose(tab)
	local pnl = tab.pnl
	local layout = {
		{	{'whistle','whistling_attention'},	{'use cableties','g26'},	{'need medbag','g80x_plu'},	{'shoot em','g23'},	{'i got the drill','g61'},	},
		{	{'we\'re overrun','g68'},	{'time to go','g17'},	{'this way','g12'},	{'straight ahead','g19'},	{'can\'t stay here','g69'},	},
		{	{'almost there','g28'},	{'get out','g07'},	{'upstairs','g02'},	{'hurry','g09'},	{'alright','g92'},	},
		{	{'let\'s go','g13'},	{'Left','g03'},	false,	{'Right','g04'},	{'thanks','s05x_sin'},	},
		{	{'halfway done','t02x_sin'},	{'careful','g10'},	{'downstairs','g01'},	{'inside','g08'},	{'ANY second','t03x_sin'},	},
		{	{'few more minutes','t01x_sin'},	{'down here','g20'},	{'wrong way','g11'},	{'keep defended','g16'},	{'take cams','g25'},	},
		{	false,	{'oh fuck','g60'},	{'need ammo','g81x_plu'},	{'shit','g29'},	false,	},
	}
	local w,h = 200,70
	local ox,oy = pnl:w()/2 - 2*w,pnl:h()/2 - 3*h
	for y,row in pairs(layout) do
		for x, obj in pairs(row) do
			if obj then
				local xx = ox + (x-1)*w
				local yy = oy + (y-1)*h
				if x == 3 then
					yy = yy + h*0.5*(y > 4 and 1 or -1)
				end
				if y == 4 then
					xx = xx + w*0.3*(x > 3 and 1 or -1)
				end
				PocoRoseButton:new(tab,{
					x = xx, y = yy, w=w, h=h,
					fontSize = 20, text=obj[1]:upper(), value=obj[2]
				})
			end
		end
	end
	local sPnl = pnl:panel{alpha = 0.4}
	sPnl:gradient{
		layer = -1,
		gradient_points = {
			0,
			cl.Black,
			1,
			cl.Black:with_alpha(0)
		},
		orientation = "vertical",
		h = pnl:h() / 3
	}
	sPnl:gradient{
		layer = -1,
		gradient_points = {
			0,
			cl.Black:with_alpha(0),
			1,
			cl.Black:with_alpha(1)
		},
		orientation = "vertical",
		y = pnl:h() / 3 * 2,
		h = pnl:h() / 3
	}
	sPnl:gradient{
		layer = -1,
		gradient_points = {
			0,
			cl.Black:with_alpha(1),
			1,
			cl.Black:with_alpha(0)
		},
		orientation = 'horizontal',
		w = pnl:w() / 3
	}
	sPnl:gradient{
		layer = -1,
		gradient_points = {
			0,
			cl.Black:with_alpha(0),
			1,
			cl.Black:with_alpha(1)
		},
		orientation = 'horizontal',
		x = pnl:w() / 3 * 2,
		w = pnl:w() / 3
	}
	--pnl:bitmap{ texture='guis/textures/test_blur_df', render_template='VertexColorTexturedBlur3D', layer=-1, w = pnl:w(), h = pnl:h()}
end

local _kitPnl,_kitPnlBtn
function PocoHud3Class._drawKit(tab)
	if not K then
		K = PocoHud3Class.K
	end
	local inGameDeep = me.inGameDeep
	local C,_y,m = PocoHud3Class,10,5
	local y = function(h,set)
		h = h and h+m or 0
		local __y = _y
		_y = set and h or _y + h
		return __y
	end
	local categories_vanity = ('set name,primary,secondary,armor,gadget,melee'):upper():split(',')
	local categories = ('name,primaries,secondaries,armor,gadget,melee'):split(',')
	local __, lbl = _.l({font=FONT, color=cl.Gray, font_size=20, pnl = tab.pnl, x = 10, y = 10},
		'* Kit profiler is dependant on your inventory setup. Any changes in your inventory(mods, sell) will be applied to the result.',true)

	local draw, _Current
	local oTabs = PocoTabs:new(me._ws,{name = 'kits',x = 10, y = 40, w = 950, th = 30, fontSize = 18, h = tab.pnl:height()-60, pTab = tab})

	local tabBtn = oTabs:add('USE KIT')
	local tabEdt =oTabs:add('EDIT')
	draw = function()
		y(10,true)
		if _kitPnl and alive(_kitPnl) then
			_kitPnl:parent():remove(_kitPnl)
		end
		local pnl = tabEdt.pnl:panel{}
		_kitPnl = pnl
		local cnt,row = 0
		local __, lbl = _.l({font=FONT, color=cl.LightSteelBlue, font_size=20, pnl = pnl, x = 20, y = y(0)},
			{PocoHud3Class.Icon.Chapter ..' Current Kit',{' '..PocoHud3Class.Icon.RC..' Save to the profiler. Unchecked items will be removed.',cl.White}},true)
		y(lbl:h())
		-- New Header with OpenIcon
		local mcm = _.g('managers.menu_component._mission_briefing_gui')
		local openInventory = function(num)
			num = num - 1
			if num == 3 or num == 4 then
				num = num + 1
			elseif num == 5 then
				num = 3
			end
			local lot = mcm and mcm._new_loadout_item
			if lot then
				me:Menu(true)
				lot:open_node(num)
			end
		end
		local hElems = {}
		for ind,name in pairs(categories_vanity) do
			if mcm and ind > 1 then
				hElems[#hElems+1] = PocoUIButton:new(tabEdt,{ pnl = pnl,
					onClick = function(self)
						openInventory(ind)
					end,
					x = 0, y = 0, w=150, h=24,
					fontSize = 22, text=name
				})
			else
				hElems[#hElems+1] = name
			end
		end
		local lH = me:_drawRow(pnl,20,hElems,20,y(),pnl:w()-40,true,true,1.3)
		y(lH,true)

		--[[ OLD drawRow
		local lH = me:_drawRow(pnl,20,categories_vanity,20,y(),pnl:w()-40,true,true,1.3)
		y(lH,true)
		--]]
		-- Current
		row = {}
		_Current = {}
		for col,category in pairs(categories) do
			if col ~= 1 then
				local text = K:current(category)
				local raw = K:current(category,true)
				local elem = PocoUIBoolean:new(tabEdt,{ pnl = pnl,
					x = 0, y = 0, w=150, h=20, category = false, name = false,
					fontSize = 18, text=text , value = true ,
				})

				_Current[category] = {elem,raw}
				row[#row+1] = elem
			else
				local s,sNum = 'kit',1
				while K.items[s..sNum] do
					sNum = sNum + 1
				end
				local elem = PocoUIStringValue:new(tabEdt,{ pnl = pnl,
					x = 0, y = 0, w=150, h=20, category = false, name = false,
					fontSize = 18, text=' ' , value = s..sNum , max = 20, hintText = 'Set this kit\'s Vanity name for yourself.'
				})
				_Current[category] = {elem}
				row[#row+1] = elem
			end
		end
		local elem = PocoUIColorValue:new(tabEdt,{ pnl = pnl,
			x = 330, y = 110, w = 300, h=30, category = false, name = false,
			fontSize = 18, text=('Button Color'):upper() , value = 'White', hintText = 'Set this kit\'s Vanity color for yourself.'
		})
		_Current['color'] = {elem}

		elem = PocoUIKeyValue:new(tabEdt,{ pnl = pnl,
			x = 120, y = 110, w = 200, h=30, category = false, name = false,
			fontSize = 18, text=('Key Bind'):upper() , value = '',
			hintText = {
				'If set, press ',{'Ctrl + ALT + THIS',cl.Yellow},' key while out-game to equip this kit.',
				{'\nCustom key-combination not available.\nDuplicated keybind can result unexpected result.\n(Only one kit can/will be equipped)',cl.Silver},
				{'\nBackspace to Remove bound key.',cl.Red}
			}
		})
		_Current['key'] = {elem}

		lH = me:_drawRow(pnl,20,row,20,y(),pnl:w()-40,false,true)
		y(lH,true)
		y(50)
		__, lbl = _.l({font=FONT, color=cl.LightSteelBlue, font_size=20, pnl = pnl, x = 20, y = y(0)},
			{PocoHud3Class.Icon.Chapter ..' Saved Kits',{' '..PocoHud3Class.Icon.RC ..' Edit or remove saved kits',cl.White}},true)
		y(lbl:h())
		lH = me:_drawRow(pnl,20,categories_vanity,20,y(),pnl:w()-40,true,true,1.3)
		y(lH,true)
		-- Kit Edt

		for ind,obj in _pairs(K.items,function(a,b)return tostring(a)<tostring(b) end) do
			row = {}
			cnt = cnt + 1
			for col,category in pairs(categories) do
				if col ~= 1 then
					local val = K:get(ind,category,true)
					row[#row+1] = val and {val,K:locked(ind,category) and cl.Red:with_alpha(0.6) or cl.White} or {'LEAVE AS IS',cl.Gray}
				else
					row[#row+1] = PocoUIButton:new(tabEdt,{ pnl = pnl,
						onClick = function(self)
							if self._t and now()-self._t<0.2 then
								K.items[ind] = nil
								K:save()
								draw()
								self:sound('item_sell')
							else
								self._t = now()
								-- Copy this value to _Current Elems
								for cat,obj in pairs(_Current) do
									if cat == 'name' then
										obj[1]:val(ind)
									elseif cat == 'color' or cat == 'key' then
										obj[2] = K:get(ind,cat)
										obj[1]:val(obj[2] or cat == 'key' and '')
									else
										if K:get(ind,cat) then
											obj[2] = K:get(ind,cat)
											_.l(obj[1].lbl,{K:get(ind,cat,true),K:locked(ind,cat) and cl.Red or cl.White},true)
											obj[1]:val(true)
										else
											obj[1]:val(false)
										end
									end
								end
							end
						end,
						x = 0, y = 0, w=150, h=22,
						fontSize = 22, text={ind,cl[K:get(ind,'color') or 'White']}, hintText = {'Click to ',{'copy',cl.Tan},'\nDoubleClick to ',{'Remove',cl.Red},' this item'}
					})
				end
			end
			lH = me:_drawRow(pnl,22,row,20,y(),pnl:w()-40,cnt % 2 == 0,true,1.1)
			y(lH,true)
		end
		tabEdt:set_h(y()+50)
		pnl:set_h(tabEdt.pnl:h())

		-- Kit Btn
		if _kitPnlBtn and alive(_kitPnlBtn) then
			_kitPnlBtn:parent():remove(_kitPnlBtn)
		end
		pnl = tabBtn.pnl:panel{}
		_kitPnlBtn = pnl

		local c,x,y,m,ww,w,h = 0,0,0,10,pnl:w()-20,300,100
		local __, lbl = _.l({font=FONT, color=cl.LightSteelBlue, font_size=20, pnl = pnl, x = 20, y = 15},
			{PocoHud3Class.Icon.Chapter ..' Profiler',{' '..PocoHud3Class.Icon.RC ..' Double click to equip a kit setup',cl.White},me.inGameDeep and {' '..PocoHud3Class.Icon.BigDot..' Disabled in game.',cl.Red} or false},true)

		if table.size(K.items) == 0 then
			_.l({font=FONT, color=cl.Silver, font_size=25, pnl = pnl, x = m, y=m*2+lbl:h()},'No Kit profiles available',true)
		end
		for ind,obj in _pairs(K.items,function(a,b)return tostring(a)<tostring(b) end) do
			x = m+(c % 3) * (w+m)
			y = 15+lbl:h()+ m+math.floor(c / 3) * (h+m)
			c = c + 1
			local name = ind
			local row = {}
			for col,category in pairs(categories) do
				if col ~= 1 then
					local val = K:get(ind,category,true)
					local locked = K:get(ind,category) and K:locked(ind,category)
					local enabled = val and not locked
					row[#row+1] = {categories_vanity[col]..' : ',enabled and cl.Tan or cl.Gray}
					if locked then
						row[#row+1] = {_.s(locked)..'\n',cl.Red:with_alpha(0.8)}
					else
						row[#row+1] = {(val or '-')..'\n',enabled and cl.White or cl.Gray}
					end
				end
			end
			local boundKey = K:get(ind,'key')
			if not inGameDeep and boundKey and boundKey ~= '' then
				row[#row+1] = {'KeyBind : ',cl.Tan}
				row[#row+1] = {'CTRL + ALT + '..boundKey..'\n',cl.Lime}
			end
			row[#row+1] = inGameDeep and 'N/A in game' or '* DoubleClick to Equip this item'
			PocoUIButton:new(tabBtn,{ pnl = pnl,
				onPressed = function(self)
					self.mute = true
				end,
				onClick = function(self)
					if not inGameDeep and self._t and now()-self._t<0.2 then
						K:equip(ind)
						self:sound('finalize_mask')
					else
						self._t = now()
					end
				end,
				x = x, y = y, w=w, h=h,
				fontSize = 25, text={ind,cl[K:get(ind,'color')] or cl.Tomato}, hintText = row
			})
		end
		tabBtn:set_h(y+h+50)
		pnl:set_h(tabBtn.pnl:h())
	end
	PocoUIButton:new(tabEdt,{
		onClick = function(self)
			local result = {}
			local name = 'Item'
			for cat,obj in pairs(_Current) do
				if cat == 'name' then
					name = obj[1]:val()
				elseif cat == 'color' or cat == 'key' then
					result[cat] = obj[1]:val()
				elseif obj[1]:val() then
						result[cat] = obj[2]
				end
			end
			if name and name~='' and table.size(result) > 0 then
				K.items[name] = result
				K:save()
				self:sound('item_buy')
				draw()
				me:_updateBind()
			else
				self:sound('menu_error')
			end
		end,
		x = 640, y = 105, w = 300, h=40,
		text={'SAVE',cl.CornFlowerBlue},hintText = {{'Add',cl.Tan},' or ',{'overwrite',cl.Tomato},' depending on the SET NAME'}
	})
	tabEdt.pnl:bitmap({
		texture = 'guis/textures/pd2/shared_lines',	wrap_mode = 'wrap',
		color = cl.White, x = 5, y = 150, w = tabEdt.pnl:w()-10, h = 2, alpha = 0.8
	})

	draw()
end

