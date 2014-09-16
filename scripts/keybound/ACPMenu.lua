require ('scripts/keybound/menubound/jobmenu')
--Secure Gage Packages--
gagepackages = gagepackages or function()
	local grabcourierpackages = {}
	local id
	for _,v in pairs(managers.interaction._interactive_objects) do
		if v.interaction then
			id = string.sub(v:interaction()._unit:name():t(), 1, 10)
			if id == "@ID05956ff"
			or id == "@IDc90378a"
			or id == "@ID96504eb"
			or id == "@IDb3cc2ab"
			or id == "@IDe8088e3"	then
					table.insert(grabcourierpackages, v:interaction())
			end
		end
	end
	for _,v in pairs(grabcourierpackages) do
		v:interact(managers.player:player_unit())
	end
	showHint("All Gage Packages Secured",3)
end
--STFU Bain--
stfubain = stfubain or function()
	if tweak_data.ACPConfig.Rats_Ingredients then
		if managers.job:current_level_id() ~= "big" and managers.job:current_level_id() ~= "roberts" then
			function DialogManager:_play_dialog(dialog, params, line)
				return
			end
			managers.chat:_receive_message(1, "STFUBain", "Activated.", tweak_data.system_chat_color)
		else
			managers.chat:_receive_message(1, "STFUBain", "Unfortunately you need Bain to complete this mission...", tweak_data.system_chat_color)
		end
	else
		if managers.job:current_level_id() ~= "big" and managers.job:current_level_id() ~= "roberts" and managers.job:current_level_id() ~= "alex_1" then
			function DialogManager:_play_dialog(dialog, params, line)
				return
			end
			managers.chat:_receive_message(1, "STFUBain", "Activated.", tweak_data.system_chat_color)
		else
			managers.chat:_receive_message(1, "STFUBain", "Unfortunately you need Bain to complete this mission...", tweak_data.system_chat_color)
		end
	end
end
-- Disable Cameras
disablecams = disablecams or function()
	if isHost() then
		for _, cam_unit in ipairs(SecurityCamera.cameras) do
			if cam_unit:enabled() then
				cam_unit:base():set_detection_enabled(false)
			end
		end
	else
		showHint("You're not the Host, dumbass.",3)
	end
end

--Add items--
function additems(itemid)
	managers.player:add_special( { name = itemid, silent = true, amount = 1 } )
	managers.chat:_receive_message(1, itemid, "Added to inventory.", tweak_data.system_chat_color)
end

--Remove items--
function removeitems(itemid)
	if managers.player:has_special_equipment(itemid) then 
		managers.player:remove_special(itemid)
		managers.chat:_receive_message(1, itemid, "Removed from inventory.", tweak_data.system_chat_color)
	end
end

-- Manually set off alarm --
soundalarm = soundalarm or function()
	if isHost() then
		managers.groupai:state():on_police_called("default")
	else
		showHint("You're not the Host, dumbass.",3)
	end
end

-- Shout during stealth --
shout = shout or function()
	if managers.groupai.state then
		managers.groupai:state()._whisper_mode = false
	end
end

-- Skill Functions --
setskill = function(points)
	managers.skilltree:_set_points(points)
end

-- Money Functions --
resetmoney = function()
	managers.money:_deduct_from_total(999999999999999999999)
	managers.money:_deduct_from_offshore(999999999999999999999)
end
add1spend = function()
	managers.money:_add_to_total(5000000)
	managers.money:_deduct_from_offshore(4000000)
end
add10spend = function()
	managers.money:_add_to_total(50000000)
	managers.money:_deduct_from_offshore(40000000)
end
add50offshore = function()
	managers.money:_add_to_total(62500000)
	managers.money:_deduct_from_total(12500000)
end
rem50offshore = function()
	managers.money:_deduct_from_offshore(50000000)
end

-- Achievement Functions

local achieveid = {}
achieveid["bigbank_4"] = '12 Angry Minutes'
achieveid["gage_2"] = '3000 Miles to the Safe House'
achieveid["gage_7"] = 'Above the Law'
achieveid["armored_10"] = 'Affordable Healthcare'
achieveid["halloween_3"] = 'Afraid of the Dark'
achieveid["charliesierra_5"] = 'All Eggs in One Basket'
achieveid["gage3_4"] = 'Arachnes Curse'
achieveid["gage2_10"] = 'Are You Kidding Me?'
achieveid["armed_and_dangerous"] = 'Armed and Dangerous'
achieveid["armed_to_the_teeth"] = 'Armed to the Teeth'
achieveid["gage5_3"] = 'Army of One'
achieveid["gage5_5"] = 'Artillery Barrage'
achieveid["death_20"] = 'At a Crossroads'
achieveid["gage3_14"] = 'A Taste of Their Own Medicine'
achieveid["bob_1"] = 'A Vote for Change'
achieveid["death_23"] = 'A Walk in the Park'
achieveid["bigbank_6"] = 'Backing Bobblehead Bob'
achieveid["gage4_10"] = 'Bang for the Buck'
achieveid["death_16"] = 'Because Thats Where the Money Is'
achieveid["death_3"] = 'Becoming a Regular'
achieveid["ignominy_2"] = 'Becoming Disgraceful'
achieveid["ignominy_1"] = 'Becoming Infamous'
achieveid["ignominy_4"] = 'Becoming Notorious'
achieveid["ignominy_5"] = 'Becoming Vicious'
achieveid["ignominy_3"] = 'Becoming Wicked'
achieveid["gage5_2"] = 'Big Bada Boom'
achieveid["big_deal"] = 'Big Deal'
achieveid["death_4"] = 'Blood on the Dance Floor'
achieveid["death_33"] = 'Breaking Bad'
achieveid["gage3_1"] = 'Build Me an Army Worthy of Crime.net'
achieveid["bullet_dodger"] = 'Bullet Dodger'
achieveid["gmod_2"] = 'Bulls-Eye'
achieveid["armored_2"] = 'But Wait - Theres More!'
achieveid["death_2"] = 'Came in Like a Wrecking Ball'
achieveid["frappucino_to_go_please"] = 'Cappuccino to Go, Please'
achieveid["big_shot"] = 'Career Criminal'
achieveid["caribbean_pirate"] = 'Caribbean Pirate'
achieveid["death_15"] = 'Cash in Before You Cash Out!'
achieveid["death_18"] = 'Cash Is King'
achieveid["death_11"] = 'Changing the World..'
achieveid["halloween_9"] = 'Christmas Came Early'
achieveid["gage4_8"] = 'Clay Pigeon Shooting'
achieveid["gage2_2"] = 'Cloak and Dagger'
achieveid["hot_wheels"] = 'Coming in Hot'
achieveid["gage_3"] = 'Commando'
achieveid["death_29"] = 'Completely OVERKILL!'
achieveid["charliesierra_8"] = 'Dead Presents'
achieveid["bob_7"] = 'Death Wish Swinger'
achieveid["diamonds_are_forever"] = 'Diamonds Are Forever'
achieveid["gage3_13"] = 'Didnt See That Coming Did You?'
achieveid["doctor_fantastic"] = 'Doctor Fantastic'
achieveid["gage2_1"] = 'Doctor Miserable'
achieveid["gage3_11"] = 'Dodge This'
achieveid["bigbank_5"] = 'Dont Bring the Heat'
achieveid["bigbank_9"] = 'Dont Forget to Floss'
achieveid["gage2_7"] = 'Dont Push It'
achieveid["gage3_16"] = 'Double Kill'
achieveid["death_21"] = 'Downtown Madness'
achieveid["gmod_4"] = 'Eagle Eyes'
achieveid["charliesierra_7"] = 'Eco Round'
achieveid["bigbank_7"] = 'Entrapment'
achieveid["gage4_7"] = 'Everyday Im Shovelin'
achieveid["gage3_7"] = 'Far, Far Away'
achieveid["f_in_chemistry"] = 'F in Chemistry'
achieveid["gage_9"] = 'Fire in the Hole!'
achieveid["halloween_nightmare_1"] = 'First Nightmare'
achieveid["fish_ai"] = 'Fish A.I.'
achieveid["armored_9"] = 'Fool Me Once, Shame on You.'
achieveid["death_12"] = 'For Better or Worse'
achieveid["gage4_12"] = 'Four Monkeys'
achieveid["halloween_nightmare_4"] = 'Fourth Nightmare'
achieveid["halloween_10"] = 'From Russia With Love'
achieveid["fully_loaded"] = 'Fully Loaded'
achieveid["halloween_2"] = 'Full Measure'
achieveid["bigbank_10"] = 'Funding Father'
achieveid["bob_10"] = 'Ghost Riders'
achieveid["going_places"] = 'Going Places'
achieveid["the_wire"] = 'Guessing Game'
achieveid["guilty_of_crime"] = 'Guilty of Crime'
achieveid["gage_8"] = 'Guns Are Like Shoes'
achieveid["gage5_8"] = 'Hammertime'
achieveid["gage_6"] = 'Hard Corps'
achieveid["armored_11"] = 'Heat Around the Corner'
achieveid["gmod_7"] = 'High Speed, Low Drag'
achieveid["death_9"] = 'High Way to Hell'
achieveid["gage2_8"] = 'HOLY SHI-'
achieveid["bob_8"] = 'Hot Lava 2.0'
achieveid["how_do_you_like_me_now"] = 'How Do You Like Me Now?'
achieveid["gage2_9"] = 'I Aint Got Time to Bleed'
achieveid["halloween_1"] = 'I Am the One Who Knocks'
achieveid["kosugi_5"] = 'I Am Ninja'
achieveid["armored_8"] = 'I Did Not Have Sexual Relations With That Bulldozer'
achieveid["armored_4"] = 'I Do What I Do Best, I Take Scores'
achieveid["kosugi_1"] = 'I Will Fade to Dark'
achieveid["death_7"] = 'If You Cant Take the Heat...'
achieveid["armored_3"] = 'If You Liked It You Should Have Put a Ring on It'
achieveid["murphys_laws"] = 'I Got It, I Got It!'
achieveid["bob_2"] = 'I Invented the Internet'
achieveid["i_knew_what_i_was_doing_was_wrong"] = 'I Knew What I Did Was Wrong'
achieveid["death_32"] = 'Im a Firestarter'
achieveid["im_a_healer_tank_damage_dealer"] = 'Im a Healer-Tank-Damage-Dealer'
achieveid["bob_3"] = 'Im a Swinger'
achieveid["going_all_in"] = 'Im Going All-in!'
achieveid["armored_7"] = 'Im Not a Crook!'
achieveid["gage_5"] = 'Inception'
achieveid["death_8"] = 'Into the Lions Den'
achieveid["gage2_6"] = 'In Town Youre the Law, Out Here Its Me'
achieveid["kosugi_2"] = 'I Will Pass Through Walls'
achieveid["charliesierra_2"] = 'Is Everything OK?'
achieveid["kosugi_3"] = 'I Will Take With Impunity'
achieveid["halloween_5"] = 'Its Alive! ITS ALIVE!'
achieveid["death_24"] = 'Its Always Foggy in Washington D.C.'
achieveid["bigbank_2"] = 'It Takes a Pig to Kill a Pig'
achieveid["bigbank_1"] = 'It Takes Two to Tango'
achieveid["i_wasnt_even_there"] = 'I Wasnt Even There!'
achieveid["kosugi_4"] = 'I Will Walk Faceless Among Men'
achieveid["kosugi_6"] = 'I Will Die and Die and Die Again'
achieveid["gage2_4"] = 'Killins As Easy As Breathing'
achieveid["king_of_the_hill"] = 'King of the Hill'
achieveid["gage4_6"] = 'Knock, Knock'
achieveid["gage2_5"] = 'They Drew First Blood, Not Me'
achieveid["gage3_8"] = 'Last Action Villain'
achieveid["lets_do_this"] = 'Lets Do Th...'
achieveid["armored_6"] = 'Let Them Watch'
achieveid["gmod_5"] = 'Like A Boy Killing Snakes'
achieveid["death_5"] = 'Like a Fucking Sputnik!'
achieveid["like_an_angry_bear"] = 'Like an Angry Bear'
achieveid["armored_5"] = 'License to Kill'
achieveid["gage4_2"] = 'Lock, Stock & Eight Smoking Barrels'
achieveid["death_26"] = 'Long-Term Relationship'
achieveid["gage3_3"] = 'Lord of the Flies'
achieveid["lord_of_war"] = 'Lord of War'
achieveid["death_10"] = 'Making Crime Into an Art Form'
achieveid["gmod_9"] = 'Mall Ninja'
achieveid["iron_man"] = 'Man of Iron'
achieveid["masked_villain"] = 'Masked Villain'
achieveid["bob_5"] = 'Master Detective'
achieveid["gage3_10"] = 'Maximum Penetration'
achieveid["charliesierra_3"] = 'Merry Christmas!'
achieveid["death_35"] = 'Moonlighting'
achieveid["most_wanted"] = 'Most Wanted'
achieveid["bob_6"] = 'Murphys Law'
achieveid["gmod_3"] = 'My Spider Sense is Tingling'
achieveid["gage4_11"] = 'No Heist for Old Men'
achieveid["halloween_7"] = 'No One Can Hear You Scream'
achieveid["no_one_cared_who_i_was"] = 'No One Cared Who I Was...'
achieveid["gage5_7"] = 'Not Today'
achieveid["no_turning_back"] = 'No Turning Back'
achieveid["death_30"] = 'OVERKILL Salutes You!'
achieveid["pink_panther"] = 'Painting Yourself Into a Corner'
achieveid["gage3_5"] = 'Pest Control'
achieveid["gmod_8"] = 'Point n Shoot'
achieveid["gage4_1"] = 'Police Brutality'
achieveid["gmod_1"] = 'Praying Mantis'
achieveid["gage5_1"] = 'Precision Aiming'
achieveid["gage3_17"] = 'Public Enemy No. 1'
achieveid["gage_4"] = 'Public Enemies'
achieveid["halloween_6"] = 'Pump-Action'
achieveid["gage5_9"] = 'Rabbit Hunting'
achieveid["charliesierra_9"] = 'Reindeer Games'
achieveid["gmod_10"] = 'Russian Operator'
achieveid["halloween_nightmare_2"] = 'Second Nightmare'
achieveid["gage3_6"] = 'Seer of Death'
achieveid["gage4_4"] = 'Seven Eleven'
achieveid["charliesierra_1"] = 'Sewer Rats'
achieveid["gage_10"] = 'Share the Love'
achieveid["death_22"] = 'Shipment and Handling'
achieveid["death_28"] = 'Shit Just Got Real'
achieveid["gage4_9"] = 'Shock and Awe'
achieveid["window_cleaner"] = 'Shoot the Glass!'
achieveid["short_fuse"] = 'Short Fuse'
achieveid["gage4_5"] = 'Shotgun 101'
achieveid["gone_in_30_seconds"] = 'Smooth Criminal'
achieveid["death_13"] = 'Snatch and Grab'
achieveid["gage5_4"] = 'So Many Choices'
achieveid["death_34"] = 'Special Delivery'
achieveid["spend_money_to_make_money"] = 'Spend Money to Make Money'
achieveid["bob_4"] = 'Storage Hunter'
achieveid["death_17"] = 'Striking Gold'
achieveid["gage3_12"] = 'Surprise Motherfucker'
achieveid["bigbank_3"] = 'Sweet Sixteen'
achieveid["gage4_3"] = 'Swing Dancing'
achieveid["gage2_3"] = 'The Eighth and Final Rule'
achieveid["the_first_line"] = 'The First Line'
achieveid["gage3_2"] = 'The Man With the Golden Gun'
achieveid["halloween_8"] = 'The Pumpkin King Made Me Do It!'
achieveid["gmod_6"] = 'There and Back Again'
achieveid["bilbo_baggin"] = 'They See Me Baggin, They Hatin'
achieveid["halloween_nightmare_3"] = 'Third Nightmare'
achieveid["tip_the_scales"] = 'Tip the Scales'
achieveid["death_27"] = 'Tough Act to Follow'
achieveid["death_14"] = 'Tough As Diamonds'
achieveid["gage5_10"] = 'Tour de Clarion'
achieveid["gage3_9"] = 'Triple Kill'
achieveid["gage5_6"] = 'Unusual Suspects'
achieveid["charliesierra_4"] = 'Upside Down'
achieveid["gage_1"] = 'Wanted'
achieveid["weapon_collector"] = 'Weapon Collector'
achieveid["charliesierra_6"] = 'We Are All Professionals'
achieveid["death_1"] = 'Wedding Crashers'
achieveid["armored_1"] = 'Were Gonna Need a Bigger Boat'
achieveid["death_6"] = 'Who Let the Doge Out?'
achieveid["halloween_4"] = 'Witch Doctor'
achieveid["death_31"] = 'With an Iron Fist'
achieveid["would_you_like_your_receipt"] = 'Would You Like Your Receipt?'
achieveid["yeah_hes_a_gold_digger"] = 'Yeah Hes a Gold Digger'
achieveid["death_19"] = 'Yes Hello, Id Like to Make a De-paws-it'
achieveid["bob_9"] = 'Yes We Can!'
achieveid["gage3_15"] = 'You Cant Hide'
achieveid["you_gotta_start_somewhere"] = 'You Gotta Start Somewhere'
achieveid["bigbank_8"] = 'You Owe Me One'
achieveid["you_shall_not_pass"] = 'You Shall Not Pass!'

function addachieve(achieveid)
    if managers.achievment then
        for id,_ in pairs(managers.achievment.achievments) do
            managers.achievment:award( achieveid )
        end
    end
end
addallachievements = addallachievements or function()
    if managers.achievment then
        for id,_ in pairs(managers.achievment.achievments) do
            managers.achievment:award( id )
        end
    end
end
function remachieve(achieveid)
    if managers.achievment then
        for id,_ in pairs(managers.achievment.achievments) do
            if managers.achievment:get_info( achieveid ).awarded then
                managers.achievment:clear_steam(achieveid)
            end
        end
    end
end
remallachievements = remallachievements or function()
    if managers.achievment then
        for id,_ in pairs(managers.achievment.achievments) do
            if managers.achievment:get_info( id ).awarded then
                managers.achievment:clear_steam(id)
            end
        end
    end
end

-- Inventory Menu
remnew = function()
    Global.blackmarket_manager.new_drops = {}
end
-- UNLOCK MASK SLOTS
unlockmaskslots = function()
    for i = 1, 300 do Global.blackmarket_manager.unlocked_mask_slots[i] = true 
    end
end
-- UNLOCK PRIMARY WEAPON SLOTS 
unlockprimslot = function()
    for i = 1, 300 do
    Global.blackmarket_manager.unlocked_weapon_slots.primaries[i] = true
    end
end
-- UNLOCK SECONDARY WEAPON SLOTS 
unlocksecslot = function()
    for i = 1, 300 do
    Global.blackmarket_manager.unlocked_weapon_slots.secondaries[i] = true
    end
end
-- Give Items
function giveitems( argumentTable )
    local itype = argumentTable["type"]
    local times = argumentTable["times"]
    
    local types = {"weapon_mods", "masks", "materials", "textures", "colors"}
    local skip = { masks = {"character_locked"}, materials = {"plastic"}, colors = {"nothing"}, textures = {"no_color_full_material","no_color_no_material"} }
    if not times then times = 1 end
	if type(itype) == "table" then types = itype end
	if itype == "all" or type(itype) == "table" then
		for i = 1, #types do giveitems({ ["type"] = types[i], ["times"] = times }) end
		return
	end
    for i=1, times do
        for mat_id,_ in pairs(tweak_data.blackmarket[itype]) do
            if not in_table(skip[itype], mat_id) then
                local global_value = "normal"
                if _.global_value then
                global_value = _.global_value
                elseif _.infamous then
                    global_value = "infamous"
                elseif _.dlcs or _.dlc then
                local dlcs = _.dlcs or {}
                if _.dlc then table.insert( dlcs, _.dlc ) end
                    global_value = dlcs[ math.random( #dlcs ) ]
                end
                if _.unlocked == false then _.unlocked = true end
            managers.blackmarket:add_to_inventory(global_value, itype, mat_id, false)
            end
        end
    end
end
-- Add Masks Individually
local maskid = {}
maskid["alienware"] = 'Alienware'
maskid["gage_deltaforce"] = 'Alpha Force'
maskid["baby_angry"] = 'Angry Baby'
maskid["anonymous"] = 'Anonymous'
maskid["pitbull"] = 'Arnold'
maskid["robberfly"] = 'Asilidae'
maskid["babyrhino"] = 'Baby Rhino'
maskid["evil"] = 'Black Death'
maskid["mr_sinister"] = 'Black Hearted'
maskid["brazil_baby"] = 'Brazil Baby'
maskid["day_of_the_dead"] = 'Calaca'
maskid["chains"] = 'Chains'
maskid["chains_clean"] = 'Chains Begins'
maskid["eagle"] = 'Chuck'
maskid["skullmonkey"] = 'Clint'
maskid["cloth_commander"] = 'Commander Crime'
maskid["tcn"] = 'Criminal Ambitions'
maskid["crowgoblin"] = 'Crow Goblin'
maskid["baby_cry"] = 'Cry Baby'
maskid["cthulhu"] = 'Cthulhu'
maskid["dallas"] = 'Dallas'
maskid["dallas_clean"] = 'Dallas Begins'
maskid["irondoom"] = 'Doctor Crime'
maskid["goat"] = 'Dolph'
maskid["frank"] = 'Frank'
maskid["santa_mad"] = 'Furious Santa'
maskid["greek_tragedy"] = 'Greek Tragedy'
maskid["baby_happy"] = 'Happy Baby'
maskid["santa_happy"] = 'Happy Santa'
maskid["heat"] = 'Hockey Heat'
maskid["hockey"] = 'Hockey Mask'
maskid["hoxton"] = 'Hoxton'
maskid["hoxton_clean"] = 'Hoxton Begins'
maskid["panda"] = 'Jean-Claude'
maskid["mandril"] = 'John'
maskid["kawaii"] = 'Kawaii'
maskid["demonictender"] = 'Kenneth'
maskid["bear"] = 'Mark'
maskid["metalhead"] = 'Metalhead'
maskid["monkeybiss"] = 'Monkey Business'
maskid["rubber_male"] = 'Mr. Mannequin'
maskid["rubber_female"] = 'Mrs. Mannequin'
maskid["scarecrow"] = 'Mr. Sackcloth'
maskid["tounge"] = 'Mr. Smooth'
maskid["oni"] = 'Oni'
maskid["unicorn"] = 'Peter'
maskid["galax"] = 'Professor Wrath'
maskid["pumpkin_king"] = 'Pumpkin King'
maskid["orangutang"] = 'Rutger'
maskid["samurai"] = 'Somem Mempo'
maskid["mantis"] = 'Sphodromantis'
maskid["silverback"] = 'Steven'
maskid["santa_surprise"] = 'Surprised Santa'
maskid["spider"] = 'Tarantula'
maskid["santa_drunk"] = 'Tipsy Santa'
maskid["washington"] = 'The 1st'
maskid["lincoln"] = 'The 16th'
maskid["grant"] = 'The 18th'
maskid["nixon"] = 'The 37th'
maskid["clinton"] = 'The 42nd'
maskid["bush"] = 'The 43rd'
maskid["obama"] = 'The 44th'
maskid["biglips"] = 'The Big Lips'
maskid["brainiack"] = 'The Brainiack'
maskid["bullet"] = 'The Bullet'
maskid["welder"] = 'The Butcher'
maskid["outlandish_a"] = 'The Cannula'
maskid["ancient"] = 'The Crossbreed'
maskid["clowncry"] = 'The Crybaby'
maskid["skulloverkillplus"] = 'The Death Wish Skull'
maskid["dillinger_death_mask"] = 'The Dillinger Death Mask'
maskid["dripper"] = 'The Dripper'
maskid["franklin"] = 'The First American'
maskid["gagball"] = 'The Gagball'
maskid["gage_blade"] = 'The Gage Blade'
maskid["grin"] = 'The Grin'
maskid["skullhard"] = 'The Hard Skull'
maskid["aviator"] = 'The Heat'
maskid["hog"] = 'The Hog'
maskid["demon"] = 'The Horned Beast'
maskid["jaw"] = 'The Jaw'
maskid["mummy"] = 'The Mummy'
maskid["optimist_prime"] = 'The Optimist'
maskid["twitch_orc"] = 'The Orc'
maskid["outlandish_b"] = 'The Outlander'
maskid["skulloverkill"] = 'The OVERKILL Skull'
maskid["outlandish_c"] = 'The Perfect Stranger'
maskid["plague"] = 'The Plague Doctor'
maskid["stonekisses"] = 'The Pout'
maskid["buha"] = 'The Rage'
maskid["shogun"] = 'The Shogun'
maskid["skull"] = 'The Skull'
maskid["shrunken"] = 'The Shrunken Head'
maskid["smoker"] = 'The Specialist'
maskid["ghost"] = 'The Spectre'
maskid["clown_56"] = 'The Starved'
maskid["troll"] = 'The Troll'
maskid["gage_rambo"] = 'The Troubled War Veteran'
maskid["dawn_of_the_dead"] = 'The Undead'
maskid["vampire"] = 'The Vampire'
maskid["skullveryhard"] = 'The Very Hard Skull'
maskid["zipper"] = 'The Zipper'
maskid["zombie"] = 'The Zombie'
maskid["venomorph"] = 'Venomorph'
maskid["wasp"] = 'Vespula'
maskid["volt"] = 'Volt'
maskid["surprise"] = 'War Face'
maskid["witch"] = 'Witch'
maskid["wolf"] = 'Wolf'
maskid["wolf_clean"] = 'Wolf Begins'

function addmask(maskid)
    managers.blackmarket:add_to_inventory("pd2_clan", "masks", maskid, false)
end

-- Drop Keycard
function dropkeycard()
	if managers.player:has_special_equipment("bank_manager_key") then    
		local pos = managers.player:player_unit():position()
		local rot = managers.player:player_unit():rotation()
		managers.player:remove_special("bank_manager_key")
		World:spawn_unit( Idstring("units/payday2/pickups/gen_pku_keycard/gen_pku_keycard"), pos, rot)
	end
end

-- DJ Menu --
local _music 
local music = { 
    play = function(num) 
        _music.stop() 
        Global.music_manager.source:set_switch( "music_randomizer", "track_"..num ) 
        _music.set('control') 
    end, 
    set = function(mode) 
        managers.music:post_event( type(mode)=='table' and mode[1] or "music_heist_"..mode ) 
    end, 
    stop = function() 
        managers.music:stop() 
    end 
} 
_music = music 

-------------------------------------------------------
ACPMenu = CustomMenuClass:new({hasLoading = false})

if inGame() and isPlaying() then
	ACPMenu:addMainMenu('ingame_menu', { title = 'In-Game Menu', maxColumns = 3 } )
else
	ACPMenu:addMainMenu('outgame_menu', { title = 'Out-of-Game Menu', maxColumns = 3 } )
end
ACPMenu:addMenu('keybind_menu', { title = 'Keybinding List', maxColumns = 3 } )
ACPMenu:addMenu('skill_menu', { title = 'Skill Point Manager' } )
ACPMenu:addMenu('money_menu', { title = 'Money Manager' } )
ACPMenu:addMenu('achieve_menu', { title = 'Achievement Manager' } )
ACPMenu:addMenu('addachieve_menu', { title = 'Add Achievements Individually', maxColumns = 3 } )
ACPMenu:addMenu('remachieve_menu', { title = 'Remove Achievements Individually', maxColumns = 3 } )
ACPMenu:addMenu('inv_menu', { title = 'Inventory Manager' } )
ACPMenu:addMenu('mask_menu', { title = 'Add Masks Individually', maxColumns = 3 } )
ACPMenu:addMenu('weaponmod_menu', { title = 'Add Weapon Mods Individually', maxColumns = 3 } )
ACPMenu:addMenu('dj_menu', { title = 'Music Manager' } )
ACPMenu:addMenu('track_list', { title = 'Music Manager\nPlay Individual Tracks' } )

-- In-Game Menu
ACPMenu:addInformationOption('ingame_menu', '.:: Main Features ::.')
ACPMenu:addOption('ingame_menu', 'Make Bain STFU', { callback = stufbain } )
ACPMenu:addOption('ingame_menu', 'Secure Gage Packages', { callback = gagepackages } )
ACPMenu:addOption('ingame_menu', 'Remove Invisible Walls', { callback = dofiles, callbackData = 'scripts/keybound/menubound/invisiblewalls.lua' } )
ACPMenu:addOption('ingame_menu', 'Disable Cameras', { callback = disablecams, help = 'Host Only' } )
ACPMenu:addOption('ingame_menu', 'Shout During Stealth', { callback = shout } )
ACPMenu:addOption('ingame_menu', 'Drop Keycard', { callback = dropkeycard, help = 'You must be holding a keycard for this to work', closeMenu = true } )
ACPMenu:addGap('ingame_menu')
ACPMenu:addMenuOption('ingame_menu', 'Escape Chain', 'escape_chain')
ACPMenu:addMenuOption('ingame_menu', 'Music Manager', 'dj_menu')
ACPMenu:addInformationOption('ingame_menu', '.:: Troll Items ::.')
ACPMenu:addOption('ingame_menu', 'Give C4', { callback = additems, callbackData = 'c4', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Give Drill', { callback = additems, callbackData = 'drill', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Give Gold Bar', { callback = additems, callbackData = 'gold', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Give Blood Sample', { callback = additems, callbackData = 'blood_sample_verified', closeMenu = true } )
ACPMenu:addGap('ingame_menu')
ACPMenu:addOption('ingame_menu', 'Remove C4', { callback = removeitems, callbackData = 'c4', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Remove Drill', { callback = removeitems, callbackData = 'drill', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Remove Gold Bar', { callback = removeitems, callbackData = 'gold', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Remove Blood Sample', { callback = removeitems, callbackData = 'blood_sample_verified', closeMenu = true } )
ACPMenu:addInformationOption('ingame_menu', '.:: Troll Features ::.')
ACPMenu:addOption('ingame_menu', 'Cops to Dozer', { callback = dofiles, callbackData = 'scripts/keybound/menubound/cop2dozer.lua', help = 'Host Only', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Jibbsplosion', { callback = dofiles, callbackData = 'scripts/keybound/menubound/jibbsplosion.lua', help = 'Host Only', closeMenu = true } )
ACPMenu:addOption('ingame_menu', 'Sound the Alarm', { callback = soundalarm, help = 'Host Only', closeMenu = true } )

-- Main Out-Game Menu
ACPMenu:addMenuOption('outgame_menu', 'Skill Manager', 'skill_menu' )
ACPMenu:addGap('outgame_menu')
ACPMenu:addMenuOption('outgame_menu', 'Money Manager', 'money_menu' )
ACPMenu:addGap('outgame_menu')
ACPMenu:addMenuOption('outgame_menu', 'Achievement Manager', 'achieve_menu' )
ACPMenu:addGap('outgame_menu')
ACPMenu:addMenuOption('outgame_menu', 'Inventory Manager', 'inv_menu' )
ACPMenu:addGap('outgame_menu')
ACPMenu:addGap('outgame_menu')
ACPMenu:addGap('outgame_menu')
ACPMenu:addMenuOption('outgame_menu', 'Job Manager', 'job_menu' )
ACPMenu:addGap('outgame_menu')
ACPMenu:addMenuOption('outgame_menu', 'Music Manager', 'dj_menu')


-- DJ Menu
ACPMenu:addGap('dj_menu')
ACPMenu:addMenuOption('dj_menu', 'Play Individual Tracks', 'track_list')
ACPMenu:addGap('dj_menu')
ACPMenu:addGap('dj_menu')
ACPMenu:addOption('dj_menu', 'Stop Music', { callback = music.stop } )
for i=1,5 do
ACPMenu:addGap('dj_menu')
end
ACPMenu:addOption('dj_menu', 'Main Menu Music', { callback = music.set, callbackData = {'menu_music'} } )
ACPMenu:addOption('dj_menu', 'Loadout Music', { callback = music.set, callbackData = {'loadout_music'} } )
ACPMenu:addOption('dj_menu', 'Stealth Music', { callback = music.set, callbackData = 'setup' } )
ACPMenu:addOption('dj_menu', 'Control Music', { callback = music.set, callbackData = 'control' } )
ACPMenu:addOption('dj_menu', 'Anticipation Music', { callback = music.set, callbackData = 'anticipation' } )
ACPMenu:addOption('dj_menu', 'Assault Music', { callback = music.set, callbackData = 'assault' } )

-- Track List
ACPMenu:addOption('track_list', '1. Time Window', { callback = music.play, callbackData = '01' } )
ACPMenu:addOption('track_list', '2. Black Yellow Moebius', { callback = music.play, callbackData = '02' } )
ACPMenu:addOption('track_list', '3. The Mark', { callback = music.play, callbackData = '03' } )
ACPMenu:addOption('track_list', '4. Full Force Forward', { callback = music.play, callbackData = '04' } )
ACPMenu:addOption('track_list', '5. Tick Tock', { callback = music.play, callbackData = '05' } )
ACPMenu:addOption('track_list', '6. Fuse Box', { callback = music.play, callbackData = '06' } )
ACPMenu:addOption('track_list', '7. Razormind', { callback = music.play, callbackData = '07' } )
ACPMenu:addGap('track_list')
ACPMenu:addGap('track_list')
ACPMenu:addGap('track_list')
ACPMenu:addOption('track_list', '8. Calling All Units', { callback = music.play, callbackData = '08' } )
ACPMenu:addOption('track_list', '9. Armed to the Teeth', { callback = music.play, callbackData = '09' } )
ACPMenu:addOption('track_list', '10. Sirens in the Distance', { callback = music.play, callbackData = '10' } )
ACPMenu:addOption('track_list', '11. Wanted Dead or Alive', { callback = music.play, callbackData = '11' } )
ACPMenu:addOption('track_list', '12. Death Wish', { callback = music.play, callbackData = '12' } )
ACPMenu:addOption('track_list', '13. Shadows', { callback = music.play, callbackData = '13' } )
ACPMenu:addOption('track_list', '14. Ode to Greed', { callback = music.play, callbackData = '14' } )

-- Skill Manager
ACPMenu:addOption('skill_menu', 'Reset Skillpoints', { callback = setskill, callbackData = 0 } )
ACPMenu:addGap('skill_menu')
ACPMenu:addOption('skill_menu', 'Set to 580 Skillpoints', { callback = setskill, callbackData = 580, closeMenu = true } )
ACPMenu:addOption('skill_menu', 'Set to 120 Skillpoints', { callback = setskill, callbackData = 120, closeMenu = true } )
ACPMenu:addOption('skill_menu', 'Set to 50 Skillpoints', { callback = setskill, callbackData = 50, closeMenu = true } )
ACPMenu:addOption('skill_menu', 'Set to 8 Skillpoints', { callback = setskill, callbackData = 8, closeMenu = true } )
ACPMenu:addOption('skill_menu', 'Set to 3 Skillpoints', { callback = setskill, callbackData = 3, closeMenu = true } )
ACPMenu:addOption('skill_menu', 'Set to 1 Skillpoint', { callback = setskill, callbackData = 1, closeMenu = true } )

-- Money Manager
ACPMenu:addOption('money_menu', 'Reset All Money', { callback = resetmoney } )
ACPMenu:addGap('money_menu')
ACPMenu:addOption('money_menu', 'Add 1 Mil Spending', { callback = add1spend, closeMenu = true } )
ACPMenu:addOption('money_menu', 'Add 10 Mil Spending', { callback = add10spend, closeMenu = true } )
ACPMenu:addGap('money_menu')
ACPMenu:addOption('money_menu', 'Add 50 Mil Offshore', { callback = add50offshore, closeMenu = true } )
ACPMenu:addOption('money_menu', 'Remove 50 Mil Offshore', { callback = rem50offshore, closeMenu = true } )

-- Achievement Manager
ACPMenu:addOption('achieve_menu', 'Add ALL Achievements', { callback = addallachievements } )
ACPMenu:addMenuOption('achieve_menu', 'Add Achievements Individually', 'addachieve_menu' )
ACPMenu:addGap('achieve_menu')
ACPMenu:addOption('achieve_menu', 'Remove ALL Achievements', { callback = remallachievements } )
ACPMenu:addMenuOption('achieve_menu', 'Remove Achievements Individually', 'remachieve_menu' )

-- Add Achievements
for id,name in pairs(achieveid) do
	ACPMenu:addOption('addachieve_menu', name, { callback = addachieve, callbackData = id } )
end
-- Remove Achievements
for id,name in pairs(achieveid) do
	ACPMenu:addOption('remachieve_menu', name, { callback = remachieve, callbackData = id } )
end

-- Inventory Manager
ACPMenu:addOption('inv_menu', 'Remove New Item Marker', { callback = remnew } )
ACPMenu:addMenuOption('inv_menu', 'Add Masks Individually', 'mask_menu')
ACPMenu:addGap('inv_menu')
ACPMenu:addOption('inv_menu', 'Unlock All Primary Slots', { callback = unlockprimslot } )
ACPMenu:addOption('inv_menu', 'Unlock All Secondary Slots', { callback = unlocksecslot } )
ACPMenu:addOption('inv_menu', 'Unlock All Mask Slots', { callback = unlockmaskslots } )
for i=1,4 do
ACPMenu:addGap('inv_menu')
end
ACPMenu:addOption('inv_menu', 'Add All Weapon Mods', { callback = giveitems, callbackData = { ["type"] = "weapon_mods", ["times"] = nil} } )
ACPMenu:addOption('inv_menu', 'Add All Masks', { callback = giveitems, callbackData = { ["type"] = "masks", ["times"] = nil} } )
ACPMenu:addOption('inv_menu', 'Add All Materials', { callback = giveitems, callbackData = { ["type"] = "materials", ["times"] = nil} } )
ACPMenu:addOption('inv_menu', 'Add All Patterns', { callback = giveitems, callbackData = { ["type"] = "textures", ["times"] = nil} } )
ACPMenu:addOption('inv_menu', 'Add All Colors', { callback = giveitems, callbackData = { ["type"] = "colors", ["times"] = nil} } )

-- Add Masks Individually
for id,name in pairs(maskid) do
	ACPMenu:addOption('mask_menu', name, { callback = addmask, callbackData = id } )
end

-- Keybinding List
ACPMenu:addInformationOption('keybind_menu', '.:: In-Game Keybinds ::.')
ACPMenu:addInformationOption('keybind_menu', 'Exploding Bags -- Num Lock')
ACPMenu:addInformationOption('keybind_menu', 'Geezbola -- Print Screen')
ACPMenu:addInformationOption('keybind_menu', 'Waypoints -- Insert')
for i=1,6 do
ACPMenu:addGap('keybind_menu')
end
ACPMenu:addInformationOption('keybind_menu', '.:: In-Lobby Keybinds ::.')
ACPMenu:addInformationOption('keybind_menu', '+10 Rep Limit -- Page Up')
ACPMenu:addInformationOption('keybind_menu', '-10 Rep Limit -- Page Down')
ACPMenu:addInformationOption('keybind_menu', 'Toggle Drop In -- Pause')
ACPMenu:addInformationOption('keybind_menu', 'Unlock All Assets -- Scroll')
for i=1,5 do
ACPMenu:addGap('keybind_menu')
end
ACPMenu:addInformationOption('keybind_menu', '.:: PocoHud Keybinds ::.')
ACPMenu:addInformationOption('keybind_menu', 'Configuration -- Backspace')
ACPMenu:addInformationOption('keybind_menu', 'PocoRose -- B')


-- Job Menu --

ACPMenu:addMenu('job_menu', { title = 'Job Manager\nSelect a Contractor' } )
--[[ Contractor Difficulty ]]--
ACPMenu:addMenu('bain_diff', { title = 'Bain - Select Difficulty' } )
ACPMenu:addMenu('dentist_diff', { title = 'Dentist - Select Difficulty' } )
ACPMenu:addMenu('hector_diff', { title = 'Hector - Select Difficulty' } )
ACPMenu:addMenu('elephant_diff', { title = 'Elephant - Select Difficulty' } )
ACPMenu:addMenu('vlad_diff', { title = 'Vlad - Select Difficulty' } )
ACPMenu:addMenu('escape_diff', { title = 'Escapes - Select Difficulty' } )
--[[ Normal ]]--
ACPMenu:addMenu('bain_normal', { title = 'Bain - Select Mission' } )
ACPMenu:addMenu('dentist_normal', { title = 'Dentist - Select Mission' } )
ACPMenu:addMenu('hector_normal', { title = 'Hector - Select Mission' } )
ACPMenu:addMenu('elephant_normal', { title = 'Elephant - Select Mission' } )
ACPMenu:addMenu('vlad_normal', { title = 'Vlad - Select Mission' } )
ACPMenu:addMenu('escape_normal', { title = 'Escapes - Select Mission' } )
--[[ Hard ]]--
ACPMenu:addMenu('bain_hard', { title = 'Bain - Select Mission' } )
ACPMenu:addMenu('dentist_hard', { title = 'Dentist - Select Mission' } )
ACPMenu:addMenu('hector_hard', { title = 'Hector - Select Mission' } )
ACPMenu:addMenu('elephant_hard', { title = 'Elephant - Select Mission', maxColumns = 3 } )
ACPMenu:addMenu('vlad_hard', { title = 'Vlad - Select Mission' } )
ACPMenu:addMenu('escape_hard', { title = 'Escapes - Select Mission' } )
--[[ Very Hard ]]--
ACPMenu:addMenu('bain_veryhard', { title = 'Bain - Select Mission' } )
ACPMenu:addMenu('dentist_veryhard', { title = 'Dentist - Select Mission' } )
ACPMenu:addMenu('hector_veryhard', { title = 'Hector - Select Mission' } )
ACPMenu:addMenu('elephant_veryhard', { title = 'Elephant - Select Mission', maxColumns = 3 } )
ACPMenu:addMenu('vlad_veryhard', { title = 'Vlad - Select Mission' } )
ACPMenu:addMenu('escape_veryhard', { title = 'Escapes - Select Mission' } )
--[[ Overkill ]]--
ACPMenu:addMenu('bain_overkill', { title = 'Bain - Select Mission' } )
ACPMenu:addMenu('dentist_overkill', { title = 'Dentist - Select Mission' } )
ACPMenu:addMenu('hector_overkill', { title = 'Hector - Select Mission' } )
ACPMenu:addMenu('elephant_overkill', { title = 'Elephant - Select Mission', maxColumns = 3 } )
ACPMenu:addMenu('vlad_overkill', { title = 'Vlad - Select Mission' } )
ACPMenu:addMenu('escape_overkill', { title = 'Escapes - Select Mission' } )
--[[ Death Wish ]]--
ACPMenu:addMenu('bain_deathwish', { title = 'Bain - Select Mission' } )
ACPMenu:addMenu('dentist_deathwish', { title = 'Dentist - Select Mission' } )
ACPMenu:addMenu('hector_deathwish', { title = 'Hector - Select Mission' } )
ACPMenu:addMenu('elephant_deathwish', { title = 'Elephant - Select Mission', maxColumns = 3 } )
ACPMenu:addMenu('vlad_deathwish', { title = 'Vlad - Select Mission' } )
ACPMenu:addMenu('escape_deathwish', { title = 'Escapes - Select Mission' } )

--------------------
--[[ Fill Menus ]]--
--------------------

--[[ Main Menu ]]--
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'Bain', 'bain_diff')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'The Dentist', 'dentist_diff')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'Hector', 'hector_diff')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'The Elephant', 'elephant_diff')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'Vlad', 'vlad_diff')
ACPMenu:addGap('job_menu')
ACPMenu:addGap('job_menu')
ACPMenu:addMenuOption('job_menu', 'Escapes', 'escape_diff')
--[[ Bain Diff ]]--
ACPMenu:addMenuOption('bain_diff', 'Normal', 'bain_normal')
ACPMenu:addMenuOption('bain_diff', 'Hard', 'bain_hard')
ACPMenu:addMenuOption('bain_diff', 'Very Hard', 'bain_veryhard')
ACPMenu:addMenuOption('bain_diff', 'Overkill', 'bain_overkill')
ACPMenu:addMenuOption('bain_diff', 'Death Wish', 'bain_deathwish')
--[[ Dentist Diff ]]--
ACPMenu:addMenuOption('dentist_diff', 'Normal', 'dentist_normal')
ACPMenu:addMenuOption('dentist_diff', 'Hard', 'dentist_hard')
ACPMenu:addMenuOption('dentist_diff', 'Very Hard', 'dentist_veryhard')
ACPMenu:addMenuOption('dentist_diff', 'Overkill', 'dentist_overkill')
ACPMenu:addMenuOption('dentist_diff', 'Death Wish', 'dentist_deathwish')
--[[ Hector Diff ]]--
ACPMenu:addMenuOption('hector_diff', 'Normal', 'hector_normal')
ACPMenu:addMenuOption('hector_diff', 'Hard', 'hector_hard')
ACPMenu:addMenuOption('hector_diff', 'Very Hard', 'hector_veryhard')
ACPMenu:addMenuOption('hector_diff', 'Overkill', 'hector_overkill')
ACPMenu:addMenuOption('hector_diff', 'Death Wish', 'hector_deathwish')
--[[ Elephant Diff ]]--
ACPMenu:addMenuOption('elephant_diff', 'Normal', 'elephant_normal')
ACPMenu:addMenuOption('elephant_diff', 'Hard', 'elephant_hard')
ACPMenu:addMenuOption('elephant_diff', 'Very Hard', 'elephant_veryhard')
ACPMenu:addMenuOption('elephant_diff', 'Overkill', 'elephant_overkill')
ACPMenu:addMenuOption('elephant_diff', 'Death Wish', 'elephant_deathwish')
--[[ Vlad Diff ]]--
ACPMenu:addMenuOption('vlad_diff', 'Normal', 'vlad_normal')
ACPMenu:addMenuOption('vlad_diff', 'Hard', 'vlad_hard')
ACPMenu:addMenuOption('vlad_diff', 'Very Hard', 'vlad_veryhard')
ACPMenu:addMenuOption('vlad_diff', 'Overkill', 'vlad_overkill')
ACPMenu:addMenuOption('vlad_diff', 'Death Wish', 'vlad_deathwish')
--[[Escape Diff]]--
ACPMenu:addMenuOption('escape_diff', 'Normal', 'escape_normal')
ACPMenu:addMenuOption('escape_diff', 'Hard', 'escape_hard')
ACPMenu:addMenuOption('escape_diff', 'Very Hard', 'escape_veryhard')
ACPMenu:addMenuOption('escape_diff', 'Overkill', 'escape_overkill')
ACPMenu:addMenuOption('escape_diff', 'Death Wish', 'escape_deathwish')

--[[ Bain Normal ]]--
ACPMenu:addInformationOption('bain_normal', '.:: Main ::.')
ACPMenu:addOption('bain_normal', 'Jewelry Store', { callback = JewelryStoreNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Bank Heist: Cash', { callback = BankCashNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Bank Heist: Deposit', { callback = BankDepositNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Diamond Store', { callback = DiamondStoreNormal, closeMenu = true } )
for i=1,5 do
ACPMenu:addGap('bain_normal')
end
ACPMenu:addInformationOption('bain_normal', '.:: DLC ::.')
ACPMenu:addOption('bain_normal', 'Transport: Crossroads', { callback = TransportCrossRoadsNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Transport: Downtown', { callback = TransportDownTownNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Transport: Harbour', { callback = TransportHarbourNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Transport: Underpass', { callback = TransportUnderPassNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Transport: Park', { callback = TransportParkNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Train Heist', { callback = TrainHeistNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'GO Bank', { callback = GOBankNormal, closeMenu = true } )
ACPMenu:addOption('bain_normal', 'Shadow Raid', { callback = ShadowRaidNormal, closeMenu = true } )
--[[ Dentist Normal ]]--
ACPMenu:addOption('dentist_normal', 'The Big Bank', { callback = BigBankNormal, closeMenu = true } )
--[[ Hector Normal ]]--
ACPMenu:addOption('hector_normal', 'Watchdogs: Day 1', { callback = WatchdogsDay1Normal, closeMenu = true } )
ACPMenu:addOption('hector_normal', 'Watchdogs: Day 2', { callback = WatchdogsDay2Normal, closeMenu = true } )
ACPMenu:addGap('hector_normal')
ACPMenu:addOption('hector_normal', 'Fire Starter: Day 1', { callback = FireStarterDay1Normal, closeMenu = true } )
ACPMenu:addOption('hector_normal', 'Fire Starter: Day 2', { callback = FireStarterDay2Normal, closeMenu = true } )
ACPMenu:addOption('hector_normal', 'Fire Starter: Day 3', { callback = FireStarterDay3Normal, closeMenu = true } )
ACPMenu:addGap('hector_normal')
ACPMenu:addOption('hector_normal', 'Rats: Day 1', { callback = RatsDay1Normal, closeMenu = true } )
ACPMenu:addOption('hector_normal', 'Rats: Day 2', { callback = RatsDay2Normal, closeMenu = true } )
ACPMenu:addOption('hector_normal', 'Rats: Day 3', { callback = RatsDay3Normal, closeMenu = true } )
--[[ Elephant Normal ]]--
ACPMenu:addOption('elephant_normal', 'Framing Frame: Day 1', { callback = FramingFrameDay1Normal, closeMenu = true } )
ACPMenu:addOption('elephant_normal', 'Framing Frame: Day 2', { callback = FramingFrameDay2Normal, closeMenu = true } )
ACPMenu:addOption('elephant_normal', 'Framing Frame: Day 3', { callback = FramingFrameDay3Normal, closeMenu = true } )
for i=1,7 do
ACPMenu:addGap('elephant_normal')
end
ACPMenu:addOption('elephant_normal', 'Election Day: Day 1', { callback = ElectionDayDay1Normal, closeMenu = true } )
ACPMenu:addOption('elephant_normal', 'Election Day: Day 2', { callback = ElectionDayDay2Normal, closeMenu = true } )
ACPMenu:addOption('elephant_normal', 'Election Day: Day 3', { callback = ElectionDayDay3Normal, closeMenu = true } )
--[[ Vlad Normal ]]--
ACPMenu:addOption('vlad_normal', 'Four Stores', { callback = FourStoresNormal, closeMenu = true } )
ACPMenu:addOption('vlad_normal', 'Mallcrasher', { callback = MallCrasherNormal, closeMenu = true } )
ACPMenu:addOption('vlad_normal', 'Nightclub', { callback = NightclubNormal, closeMenu = true } )
--[[ Escape Normal ]]--
ACPMenu:addOption('escape_normal', 'Escape: Cafe', { callback = EscapeCafeNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Cafe (Day)', { callback = EscapeCafeDayNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Park', { callback = EscapeParkNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Park (Day)', { callback = EscapeParkDayNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Overpass', { callback = EscapeOverPassNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Street', { callback = EscapeStreetNormal, closeMenu = true } )
ACPMenu:addOption('escape_normal', 'Escape: Park', { callback = EscapeGarageNormal, closeMenu = true } )


--[[ Bain Hard ]]--
ACPMenu:addInformationOption('bain_hard', '.:: Main ::.')
ACPMenu:addOption('bain_hard', 'Jewelry Store', { callback = JewelryStoreHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Bank Heist: Cash', { callback = BankCashHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Bank Heist: Deposit', { callback = BankDepositHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Diamond Store', { callback = DiamondStoreHard, closeMenu = true } )
ACPMenu:addGap('bain_hard')
ACPMenu:addOption('bain_hard', 'Bank Heist: Gold (Pro)', { callback = BankGoldPROHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Bank Heist (Pro)', { callback = BankPROHard, closeMenu = true } )
ACPMenu:addGap('bain_hard')
ACPMenu:addGap('bain_hard')
ACPMenu:addInformationOption('bain_hard', '.:: DLC ::.')
ACPMenu:addOption('bain_hard', 'Transport: Crossroads', { callback = TransportCrossRoadsHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Transport: Downtown', { callback = TransportDownTownHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Transport: Harbour', { callback = TransportHarbourHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Transport: Underpass', { callback = TransportUnderPassHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Transport: Park', { callback = TransportParkHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Train Heist', { callback = TrainHeistHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'GO Bank', { callback = GOBankHard, closeMenu = true } )
ACPMenu:addOption('bain_hard', 'Shadow Raid', { callback = ShadowRaidHard, closeMenu = true } )
--[[ Dentist Hard ]]--
ACPMenu:addOption('dentist_hard', 'The Big Bank', { callback = BigBankHard, closeMenu = true } )
--[[ Hector Hard ]]--
ACPMenu:addOption('hector_hard', 'Watchdogs: Day 1', { callback = WatchdogsDay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Watchdogs: Day 2', { callback = WatchdogsDay2Hard, closeMenu = true } )
ACPMenu:addGap('hector_hard')
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 1', { callback = FireStarterDay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 2', { callback = FireStarterDay2Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 3', { callback = FireStarterDay3Hard, closeMenu = true } )
ACPMenu:addGap('hector_hard')
ACPMenu:addOption('hector_hard', 'Rats: Day 1', { callback = RatsDay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Rats: Day 2', { callback = RatsDay2Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Rats: Day 3', { callback = RatsDay3Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Watchdogs: Day 1 (Pro)', { callback = WatchdogsPRODay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Watchdogs: Day 2 (Pro)', { callback = WatchdogsPRODay2Hard, closeMenu = true } )
ACPMenu:addGap('hector_hard')
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 1 (Pro)', { callback = FireStarterPRODay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 2 (Pro)', { callback = FireStarterPRODay2Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Fire Starter: Day 3 (Pro)', { callback = FireStarterPRODay3Hard, closeMenu = true } )
ACPMenu:addGap('hector_hard')
ACPMenu:addOption('hector_hard', 'Rats: Day 1 (Pro)', { callback = RatsPRODay1Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Rats: Day 2 (Pro)', { callback = RatsPRODay2Hard, closeMenu = true } )
ACPMenu:addOption('hector_hard', 'Rats: Day 3 (Pro)', { callback = RatsPRODay3Hard, closeMenu = true } )
--[[ Elephant Hard ]]--
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 1', { callback = FramingFrameDay1Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 2', { callback = FramingFrameDay2Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 3', { callback = FramingFrameDay3Hard, closeMenu = true } )
ACPMenu:addGap('elephant_hard')
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 1 (Pro)', { callback = FramingFramePRODay1Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 2 (Pro)', { callback = FramingFramePRODay2Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Framing Frame: Day 3 (Pro)', { callback = FramingFramePRODay3Hard, closeMenu = true } )
ACPMenu:addGap('elephant_hard')
ACPMenu:addGap('elephant_hard')
ACPMenu:addGap('elephant_hard')
ACPMenu:addOption('elephant_hard', 'Election Day: Day 1', { callback = ElectionDayDay1Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Election Day: Day 2', { callback = ElectionDayDay2Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Election Day: Day 3', { callback = ElectionDayDay3Hard, closeMenu = true } )
ACPMenu:addGap('elephant_hard')
ACPMenu:addOption('elephant_hard', 'Election Day: Day 1 (Pro)', { callback = ElectionDayPRODay1Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Election Day: Day 2 (Pro)', { callback = ElectionDayPRODay2Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Election Day: Day 3 (Pro)', { callback = ElectionDayPRODay3Hard, closeMenu = true } )
ACPMenu:addGap('elephant_hard')
ACPMenu:addGap('elephant_hard')
ACPMenu:addGap('elephant_hard')
ACPMenu:addOption('elephant_hard', 'Big Oil: Day 1 (Pro)', { callback = BigOilPRODay1Hard, closeMenu = true } )
ACPMenu:addOption('elephant_hard', 'Big Oil: Day 2 (Pro)', { callback = BigOilPRODay2Hard, closeMenu = true } )
--[[ Vlad Hard ]]--
ACPMenu:addOption('vlad_hard', 'Four Stores', { callback = FourStoresHard, closeMenu = true } )
ACPMenu:addOption('vlad_hard', 'Mallcrasher', { callback = MallCrasherHard, closeMenu = true } )
ACPMenu:addOption('vlad_hard', 'Nightclub', { callback = NightclubHard, closeMenu = true } )
ACPMenu:addOption('vlad_hard', 'Ukrainian Job (Pro)', { callback = UkrainianJobPROHard, closeMenu = true } )
--[[ Escape Hard ]]--
ACPMenu:addOption('escape_hard', 'Escape: Cafe', { callback = EscapeCafeHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Cafe (Day)', { callback = EscapeCafeDayHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Park', { callback = EscapeParkHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Park (Day)', { callback = EscapeParkDayHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Overpass', { callback = EscapeOverPassHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Street', { callback = EscapeStreetHard, closeMenu = true } )
ACPMenu:addOption('escape_hard', 'Escape: Park', { callback = EscapeGarageHard, closeMenu = true } )

--[[ Bain Very Hard ]]--
ACPMenu:addInformationOption('bain_veryhard', '.:: Main ::.')
ACPMenu:addOption('bain_veryhard', 'Jewelry Store', { callback = JewelryStoreVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Bank Heist: Cash', { callback = BankCashVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Bank Heist: Deposit', { callback = BankDepositVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Diamond Store', { callback = DiamondStoreVeryHard, closeMenu = true } )
ACPMenu:addGap('bain_veryhard')
ACPMenu:addOption('bain_veryhard', 'Bank Heist: Gold (Pro)', { callback = BankGoldPROVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Bank Heist (Pro)', { callback = BankPROVeryHard, closeMenu = true } )
ACPMenu:addGap('bain_veryhard')
ACPMenu:addGap('bain_veryhard')
ACPMenu:addInformationOption('bain_veryhard', '.:: DLC ::.')
ACPMenu:addOption('bain_veryhard', 'Transport: Crossroads', { callback = TransportCrossRoadsVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Transport: Downtown', { callback = TransportDownTownVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Transport: Harbour', { callback = TransportHarbourVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Transport: Underpass', { callback = TransportUnderPassVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Transport: Park', { callback = TransportParkVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Train Heist', { callback = TrainHeistVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'GO Bank', { callback = GOBankVeryHard, closeMenu = true } )
ACPMenu:addOption('bain_veryhard', 'Shadow Raid', { callback = ShadowRaidVeryHard, closeMenu = true } )
--[[ Dentist Very Hard ]]--
ACPMenu:addOption('dentist_veryhard', 'The Big Bank', { callback = BigBankVeryHard, closeMenu = true } )
--[[ Hector Very Hard ]]--
ACPMenu:addOption('hector_veryhard', 'Watchdogs: Day 1', { callback = WatchdogsDay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Watchdogs: Day 2', { callback = WatchdogsDay2VeryHard, closeMenu = true } )
ACPMenu:addGap('hector_veryhard')
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 1', { callback = FireStarterDay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 2', { callback = FireStarterDay2VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 3', { callback = FireStarterDay3VeryHard, closeMenu = true } )
ACPMenu:addGap('hector_veryhard')
ACPMenu:addOption('hector_veryhard', 'Rats: Day 1', { callback = RatsDay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Rats: Day 2', { callback = RatsDay2VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Rats: Day 3', { callback = RatsDay3VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Watchdogs: Day 1 (Pro)', { callback = WatchdogsPRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Watchdogs: Day 2 (Pro)', { callback = WatchdogsPRODay2VeryHard, closeMenu = true } )
ACPMenu:addGap('hector_veryhard')
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 1 (Pro)', { callback = FireStarterPRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 2 (Pro)', { callback = FireStarterPRODay2VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Fire Starter: Day 3 (Pro)', { callback = FireStarterPRODay3VeryHard, closeMenu = true } )
ACPMenu:addGap('hector_veryhard')
ACPMenu:addOption('hector_veryhard', 'Rats: Day 1 (Pro)', { callback = RatsPRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Rats: Day 2 (Pro)', { callback = RatsPRODay2VeryHard, closeMenu = true } )
ACPMenu:addOption('hector_veryhard', 'Rats: Day 3 (Pro)', { callback = RatsPRODay3VeryHard, closeMenu = true } )
--[[ Elephant Very Hard ]]--
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 1', { callback = FramingFrameDay1VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 2', { callback = FramingFrameDay2VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 3', { callback = FramingFrameDay3VeryHard, closeMenu = true } )
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 1 (Pro)', { callback = FramingFramePRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 2 (Pro)', { callback = FramingFramePRODay2VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Framing Frame: Day 3 (Pro)', { callback = FramingFramePRODay3VeryHard, closeMenu = true } )
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 1', { callback = ElectionDayDay1VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 2', { callback = ElectionDayDay2VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 3', { callback = ElectionDayDay3VeryHard, closeMenu = true } )
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 1 (Pro)', { callback = ElectionDayPRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 2 (Pro)', { callback = ElectionDayPRODay2VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Election Day: Day 3 (Pro)', { callback = ElectionDayPRODay3VeryHard, closeMenu = true } )
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addGap('elephant_veryhard')
ACPMenu:addOption('elephant_veryhard', 'Big Oil: Day 1 (Pro)', { callback = BigOilPRODay1VeryHard, closeMenu = true } )
ACPMenu:addOption('elephant_veryhard', 'Big Oil: Day 2 (Pro)', { callback = BigOilPRODay2VeryHard, closeMenu = true } )
--[[ Vlad Very Hard ]]--
ACPMenu:addOption('vlad_veryhard', 'Four Stores', { callback = FourStoresVeryHard, closeMenu = true } )
ACPMenu:addOption('vlad_veryhard', 'Mallcrasher', { callback = MallCrasherVeryHard, closeMenu = true } )
ACPMenu:addOption('vlad_veryhard', 'Nightclub', { callback = NightclubVeryHard, closeMenu = true } )
ACPMenu:addOption('vlad_veryhard', 'Ukrainian Job (Pro)', { callback = UkrainianJobPROVeryHard, closeMenu = true } )
--[[ Escape Very Hard ]]--
ACPMenu:addOption('escape_veryhard', 'Escape: Cafe', { callback = EscapeCafeVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Cafe (Day)', { callback = EscapeCafeDayVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Park', { callback = EscapeParkVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Park (Day)', { callback = EscapeParkDayVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Overpass', { callback = EscapeOverPassVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Street', { callback = EscapeStreetVeryHard, closeMenu = true } )
ACPMenu:addOption('escape_veryhard', 'Escape: Park', { callback = EscapeGarageVeryHard, closeMenu = true } )


--[[ Bain Overkill ]]--
ACPMenu:addInformationOption('bain_overkill', '.:: Main ::.')
ACPMenu:addOption('bain_overkill', 'Jewelry Store', { callback = JewelryStoreOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Bank Heist: Cash', { callback = BankCashOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Bank Heist: Deposit', { callback = BankDepositOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Diamond Store', { callback = DiamondStoreOverKill, closeMenu = true } )
ACPMenu:addGap('bain_overkill')
ACPMenu:addOption('bain_overkill', 'Bank Heist: Gold (Pro)', { callback = BankGoldPROOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Bank Heist (Pro)', { callback = BankPROOverKill, closeMenu = true } )
ACPMenu:addGap('bain_overkill')
ACPMenu:addGap('bain_overkill')
ACPMenu:addInformationOption('bain_overkill', '.:: DLC ::.')
ACPMenu:addOption('bain_overkill', 'Transport: Crossroads', { callback = TransportCrossRoadsOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Transport: Downtown', { callback = TransportDownTownOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Transport: Harbour', { callback = TransportHarbourOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Transport: Underpass', { callback = TransportUnderPassOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Transport: Park', { callback = TransportParkOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Train Heist', { callback = TrainHeistOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'GO Bank', { callback = GOBankOverKill, closeMenu = true } )
ACPMenu:addOption('bain_overkill', 'Shadow Raid', { callback = ShadowRaidOverKill, closeMenu = true } )
--[[ Dentist Overkill ]]--
ACPMenu:addOption('dentist_overkill', 'The Big Bank', { callback = BigBankOverKill, closeMenu = true } )
--[[ Hector Overkill ]]--
ACPMenu:addOption('hector_overkill', 'Watchdogs: Day 1', { callback = WatchdogsDay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Watchdogs: Day 2', { callback = WatchdogsDay2OverKill, closeMenu = true } )
ACPMenu:addGap('hector_overkill')
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 1', { callback = FireStarterDay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 2', { callback = FireStarterDay2OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 3', { callback = FireStarterDay3OverKill, closeMenu = true } )
ACPMenu:addGap('hector_overkill')
ACPMenu:addOption('hector_overkill', 'Rats: Day 1', { callback = RatsDay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Rats: Day 2', { callback = RatsDay2OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Rats: Day 3', { callback = RatsDay3OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Watchdogs: Day 1 (Pro)', { callback = WatchdogsPRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Watchdogs: Day 2 (Pro)', { callback = WatchdogsPRODay2OverKill, closeMenu = true } )
ACPMenu:addGap('hector_overkill')
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 1 (Pro)', { callback = FireStarterPRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 2 (Pro)', { callback = FireStarterPRODay2OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Fire Starter: Day 3 (Pro)', { callback = FireStarterPRODay3OverKill, closeMenu = true } )
ACPMenu:addGap('hector_overkill')
ACPMenu:addOption('hector_overkill', 'Rats: Day 1 (Pro)', { callback = RatsPRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Rats: Day 2 (Pro)', { callback = RatsPRODay2OverKill, closeMenu = true } )
ACPMenu:addOption('hector_overkill', 'Rats: Day 3 (Pro)', { callback = RatsPRODay3OverKill, closeMenu = true } )
--[[ Elephant Overkill ]]--
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 1', { callback = FramingFrameDay1OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 2', { callback = FramingFrameDay2OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 3', { callback = FramingFrameDay3OverKill, closeMenu = true } )
ACPMenu:addGap('elephant_overkill')
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 1 (Pro)', { callback = FramingFramePRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 2 (Pro)', { callback = FramingFramePRODay2OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Framing Frame: Day 3 (Pro)', { callback = FramingFramePRODay3OverKill, closeMenu = true } )
ACPMenu:addGap('elephant_overkill')
ACPMenu:addGap('elephant_overkill')
ACPMenu:addGap('elephant_overkill')
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 1', { callback = ElectionDayDay1OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 2', { callback = ElectionDayDay2OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 3', { callback = ElectionDayDay3OverKill, closeMenu = true } )
ACPMenu:addGap('elephant_overkill')
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 1 (Pro)', { callback = ElectionDayPRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 2 (Pro)', { callback = ElectionDayPRODay2OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Election Day: Day 3 (Pro)', { callback = ElectionDayPRODay3OverKill, closeMenu = true } )
ACPMenu:addGap('elephant_overkill')
ACPMenu:addGap('elephant_overkill')
ACPMenu:addGap('elephant_overkill')
ACPMenu:addOption('elephant_overkill', 'Big Oil: Day 1 (Pro)', { callback = BigOilPRODay1OverKill, closeMenu = true } )
ACPMenu:addOption('elephant_overkill', 'Big Oil: Day 2 (Pro)', { callback = BigOilPRODay2OverKill, closeMenu = true } )
--[[ Vlad Overkill ]]--
ACPMenu:addOption('vlad_overkill', 'Four Stores', { callback = FourStoresOverKill, closeMenu = true } )
ACPMenu:addOption('vlad_overkill', 'Mallcrasher', { callback = MallCrasherOverKill, closeMenu = true } )
ACPMenu:addOption('vlad_overkill', 'Nightclub', { callback = NightclubOverKill, closeMenu = true } )
ACPMenu:addOption('vlad_overkill', 'Ukrainian Job (Pro)', { callback = UkrainianJobPROOverKill, closeMenu = true } )
--[[ Escape Overkill ]]--
ACPMenu:addOption('escape_overkill', 'Escape: Cafe', { callback = EscapeCafeOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Cafe (Day)', { callback = EscapeCafeDayOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Park', { callback = EscapeParkOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Park (Day)', { callback = EscapeParkDayOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Overpass', { callback = EscapeOverPassOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Street', { callback = EscapeStreetOverKill, closeMenu = true } )
ACPMenu:addOption('escape_overkill', 'Escape: Park', { callback = EscapeGarageOverKill, closeMenu = true } )

--[[ Bain Deathwish ]]--
ACPMenu:addInformationOption('bain_deathwish', '.:: Main ::.')
ACPMenu:addOption('bain_deathwish', 'Jewelry Store', { callback = JewelryStoreDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Bank Heist: Cash', { callback = BankCashDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Bank Heist: Deposit', { callback = BankDepositDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Diamond Store', { callback = DiamondStoreDeathWish, closeMenu = true } )
ACPMenu:addGap('bain_deathwish')
ACPMenu:addOption('bain_deathwish', 'Bank Heist: Gold (Pro)', { callback = BankGoldPRODeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Bank Heist (Pro)', { callback = BankPRODeathWish, closeMenu = true } )
ACPMenu:addGap('bain_deathwish')
ACPMenu:addGap('bain_deathwish')
ACPMenu:addInformationOption('bain_deathwish', '.:: DLC ::.')
ACPMenu:addOption('bain_deathwish', 'Transport: Crossroads', { callback = TransportCrossRoadsDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Transport: Downtown', { callback = TransportDownTownDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Transport: Harbour', { callback = TransportHarbourDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Transport: Underpass', { callback = TransportUnderPassDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Transport: Park', { callback = TransportParkDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Train Heist', { callback = TrainHeistDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'GO Bank', { callback = GOBankDeathWish, closeMenu = true } )
ACPMenu:addOption('bain_deathwish', 'Shadow Raid', { callback = ShadowRaidDeathWish, closeMenu = true } )
--[[ Dentist Deathwish ]]--
ACPMenu:addOption('dentist_deathwish', 'The Big Bank', { callback = BigBankDeathWish, closeMenu = true } )
--[[ Hector Deathwish ]]--
ACPMenu:addOption('hector_deathwish', 'Watchdogs: Day 1', { callback = WatchdogsDay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Watchdogs: Day 2', { callback = WatchdogsDay2DeathWish, closeMenu = true } )
ACPMenu:addGap('hector_deathwish')
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 1', { callback = FireStarterDay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 2', { callback = FireStarterDay2DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 3', { callback = FireStarterDay3DeathWish, closeMenu = true } )
ACPMenu:addGap('hector_deathwish')
ACPMenu:addOption('hector_deathwish', 'Rats: Day 1', { callback = RatsDay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Rats: Day 2', { callback = RatsDay2DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Rats: Day 3', { callback = RatsDay3DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Watchdogs: Day 1 (Pro)', { callback = WatchdogsPRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Watchdogs: Day 2 (Pro)', { callback = WatchdogsPRODay2DeathWish, closeMenu = true } )
ACPMenu:addGap('hector_deathwish')
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 1 (Pro)', { callback = FireStarterPRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 2 (Pro)', { callback = FireStarterPRODay2DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Fire Starter: Day 3 (Pro)', { callback = FireStarterPRODay3DeathWish, closeMenu = true } )
ACPMenu:addGap('hector_deathwish')
ACPMenu:addOption('hector_deathwish', 'Rats: Day 1 (Pro)', { callback = RatsPRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Rats: Day 2 (Pro)', { callback = RatsPRODay2DeathWish, closeMenu = true } )
ACPMenu:addOption('hector_deathwish', 'Rats: Day 3 (Pro)', { callback = RatsPRODay3DeathWish, closeMenu = true } )
--[[ Elephant Deathwish ]]--
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 1', { callback = FramingFrameDay1DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 2', { callback = FramingFrameDay2DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 3', { callback = FramingFrameDay3DeathWish, closeMenu = true } )
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 1 (Pro)', { callback = FramingFramePRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 2 (Pro)', { callback = FramingFramePRODay2DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Framing Frame: Day 3 (Pro)', { callback = FramingFramePRODay3DeathWish, closeMenu = true } )
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 1', { callback = ElectionDayDay1DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 2', { callback = ElectionDayDay2DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 3', { callback = ElectionDayDay3DeathWish, closeMenu = true } )
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 1 (Pro)', { callback = ElectionDayPRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 2 (Pro)', { callback = ElectionDayPRODay2DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Election Day: Day 3 (Pro)', { callback = ElectionDayPRODay3DeathWish, closeMenu = true } )
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addGap('elephant_deathwish')
ACPMenu:addOption('elephant_deathwish', 'Big Oil: Day 1 (Pro)', { callback = BigOilPRODay1DeathWish, closeMenu = true } )
ACPMenu:addOption('elephant_deathwish', 'Big Oil: Day 2 (Pro)', { callback = BigOilPRODay2DeathWish, closeMenu = true } )
--[[ Vlad Deathwish ]]--
ACPMenu:addOption('vlad_deathwish', 'Four Stores', { callback = FourStoresDeathWish, closeMenu = true } )
ACPMenu:addOption('vlad_deathwish', 'Mallcrasher', { callback = MallCrasherDeathWish, closeMenu = true } )
ACPMenu:addOption('vlad_deathwish', 'Nightclub', { callback = NightclubDeathWish, closeMenu = true } )
ACPMenu:addOption('vlad_deathwish', 'Ukrainian Job (Pro)', { callback = UkrainianJobPRODeathWish, closeMenu = true } )
--[[ Escape Deathwish ]]--
ACPMenu:addOption('escape_deathwish', 'Escape: Cafe', { callback = EscapeCafeDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Cafe (Day)', { callback = EscapeCafeDayDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Park', { callback = EscapeParkDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Park (Day)', { callback = EscapeParkDayDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Overpass', { callback = EscapeOverPassDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Street', { callback = EscapeStreetDeathWish, closeMenu = true } )
ACPMenu:addOption('escape_deathwish', 'Escape: Park', { callback = EscapeGarageDeathWish, closeMenu = true } )

--[[ Escape Chain ]]--
ACPMenu:addOption('escape_chain', 'Escape: Cafe', { callback = EscapeCafeChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Cafe (Day)', { callback = EscapeCafeDayChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Park', { callback = EscapeParkChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Park (Day)', { callback = EscapeParkDayChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Overpass', { callback = EscapeOverPassChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Overpass (Night)', { callback = EscapeOverPassNightChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Street', { callback = EscapeStreetChain, closeMenu = true } )
ACPMenu:addOption('escape_chain', 'Escape: Park', { callback = EscapeGarageChain, closeMenu = true } )

if not inTitlescreen() then
	if ACPMenu:isOpen() then
		ACPMenu:close()
	else
		ACPMenu:open()
	end
end