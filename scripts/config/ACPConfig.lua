--------------------------------------------------------------------
------------------- Main Configuration File ------------------------
--------------------------------------------------------------------
-- I recommend going through these settings in detail. ----------
-- Feel free to ask me any questions you might have. -----------
-- Make sure you exit the game before editing your config! -----
--------------------------------------------------------------------

ACPConfig = ACPConfig or class()
require 'scripts/config/DCStrings'
function ACPConfig:init()

	self.Version = 2.30						-- *****Do not change this line*****

	self.PocoHUD_Enable = true			-- Set this to false to disable PocoHUD
	
	-- Global
	self.Skip_Intro = true					-- Set this to false to re-enable the Intro movie
	self.DLC_Unlocker = true 				-- Set this to false if you already bought all the DLC
	self.Block_Steam_Stats = false		-- Set this to true to block your future stats from being updated on steam (skill points/achievements/etc). 
	
	-- Run as Persistent
	self.Infinite_Stamina = true			-- Set this to false to disable infinite stamina
	self.Fast_Mask_On = true				-- Set this to false to restore original Mask On time
	self.No_Flashbangs = true				-- Set this to false if you like being blind
	self.Classic_Stealth = true				-- Set this to false to turn off Classic Stealth
	self.Disable_Join_Pause = true			-- Set this to false to wait for 420Dial-UpSw@g to join your session
	self.No_Escape_Timer = true				-- Set this to false to enable Point of No Return (Host Only)
	self.Stop_Drill_Jamming = true			-- Set this to false to enable Drill Jamming (Cops still disable it) (Host Only)
	self.Prevent_Panic_Button = true		-- Set this to false to enable civilians pushing panic buttons
	self.Melee_Bulldozers = true			-- Set this to false to disable Bulldozer Melee'able feature
	self.Grenade_Refill = true				-- Set this to false to disable grenade refill from ammo bags
	self.Revive_First_Shout = true			-- Set this to false to restore normal revive function
	self.Infinite_Saw = true				-- Set this to false to re-enable saw blade consumption
	self.No_Job_Heat = true					-- Set this to false to restore job heat
	self.No_Fall_Damage = true				-- Set this to false to re-enable fall damage
	self.No_Shout_Delay = true				-- Set this to false to restore the delay between shouts
	self.Persistent_Crosshair = true		-- Set this to false to remove the persistent on-screen crosshair
	
	--Rebalance AI--
	self.Rebalance_AI = true 				-- Set this to false to make your Team AI suck (Must be true for following options to work)
	self.Number_of_AI = 3					-- Set this between 0 and 3 to change the number of AI (default is 2)
	self.Force_Revive_PO = true				-- Set this to false to return the AI's primary objective to shooting
	self.AI_Run_Speed = true				-- Set this to false to return the AI's speed to normal
	self.AI_Dodge_Ability = true			-- Set this to false to return the bullet dodge ability to normal
	self.AI_Initial_Health = 365			-- Change this value to alter the AI health. Default is 75
	self.AI_Cloaker_Arrest = false			-- Set this to false to make the AI get downed instead of arrested when hugged by a cloaker
	
	--Cop Damage--
	self.Messiah_Any_Weapon = true			-- Set this to false to only be able to Messiah with pistols (self revive skill)
	self.Explosive_Damage_Multiplier = true	-- Set this to false to return grenades to default damage
	
	--Money Manager--
	self.Preplanning_is_Free = true			-- Set this to false to enable cost of Preplanning favors
	self.No_Cleaner_Cost = true				-- Set this to false to re-enable Cleaner Costs
	self.No_Cost_Respec = true				-- Set this to false to restore cost of Respec'ing
	self.No_Skill_Confirmation = true		-- Set this to false to have a confirmation pop up when purchasing skills
	
	--Player Standard--
	self.Revive_First_Shout = true			-- Set this to false to restore normal revive function
	self.Interact_Lookaround = true			-- Set this to false to disable lookaround while interacting
	self.No_Shout_At_Hostages = true		-- Set this to false to be able to shout at tied civilians
	self.Sprint_Every_Direction = true 		-- Set this to false to disable sprint in all directions
	
	--Player Manager--
	self.Bag_Weight = true					-- Set this to false to restore bag weights (affects run w/ bags and throwing distance)
	self.Instant_Deploy = true				-- Set this to false to disable instant equipment deploy
	self.Bag_Cooldown = true				-- Set this to false to disable no cooldown between bag interactions
	
	--Objectives Manager--
	self.Remove_Objectives = true			-- Set this to false to re-enable objectives
	
	--Dialog Manager--
	self.Rats_Ingredients = true			-- Set this to false to disable ingredients dialog in chat
	self.Rats_Ingredient_Broadcast = true	-- Set this to true to display Rats Ingredients to everyone.
	
	--Preplanning Manager--
	self.Number_of_Favors = 21				-- Change this value to increase/decrease number of favors on Big Bank (Default: 10) (Host Only)
	self.Host_Has_Final_Say = true			-- Set this to false to enable client's votes to count
	
	--Object Interaction Manager--
	self.Interact_Thru_Walls = true			-- Set this to false to disable interaction through walls
	
	--Interaction Ext--
	self.Increased_Int_Distance = true 		-- Set this to false to return interaction distance to normal
	self.Increased_Loop_Time = true			-- Set this to false to return the Camera Loop time to normal
	self.Infinite_Camera_Loops = true		-- Set this to false to return max number of Camera Loops to 1
	self.Increased_Int_Speed = true			-- Set this to false to return interaction speeds to normal
	
	--Civilian Brain--
	self.Hostage_Follow_Limit = true		-- Set this to false to return max number of following hostages to 1
	self.Hostage_Follow_Distance = true		-- Set this to false to return to standard following distance
	
	--NewRaycastWeaponBase--
	self.Persistent_Gadget = true			-- Set this to false for your gadget to turn off when switching weapons
	
	--Cop Brain--
	self.Pager_Chance = true				-- Set this to false to restore normal Pager functions (Host Only)
	
	--Cop Sound--
	self.Stop_Cloaker_Whine = true			-- Set this to false to hear cloakers fer dayzzzz
	
	--Mission End State--
	self.Remove_XP_Screen = true			-- Set this to false if you want to see your XP add up at the end of each level
	
	--Other--
	self.Exploding_Bags = true				-- Set this to false to disable the exploding bags script on Num Lock
	self.All_Lasers_Rainbow = true			-- Set this to false to have only player's lasers rainbow
	
	--Jibb'splosion--
	self.MORE_DAKKA = false					-- Set this to false to disable Reapers Jibb song
	self.Infinite_Dozers = true				-- Set this to false to have only 100 dozer kills before you win
	
	-- Weapon Re-Balancing Scripts--
	self.Real_Names = true					-- Set this to false if you prefer the Overkill given names
	self.Fists_of_Fury = true				-- Set this to false to re-enable delay between punches & restore damage to normal
	self.Shovel_of_DOOOOM = true			-- Set this to false to re-enable delay between shovel swings & restore damage to normal
	self.Name_of_Fists = "Fists of Fury"	-- Real_Names must be true for this to have any affect. 
	
	--Geezbola Functions--
	--self.KA_Client = true					-- Set this to false to disable Geezbola as a client (Currently not working as client)
	self.KA_Kills_Civilians = true 			-- Set this to false to not kill civilians
	self.KA_Disables_Cameras = true 		-- Set this to false to leave cameras intact (Host Only)
end