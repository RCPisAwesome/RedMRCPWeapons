RegisterCommand('rcpweapons', function() 
	SendNUIMessage({showmenu = true})
	SetNuiFocus(true, true)
end, false)

RegisterNUICallback('weapon', function(data)
	CreateThread(function()
		local hashdata = data.hash
		if string.find(hashdata, "WEAPON") then
			hash = GetHashKey(hashdata)
		else
			hash = "0x"..hashdata
		end
		GiveWeaponToPed_2(PlayerPedId(),tonumber(hash),1,true,true,1,false,0.5,1.0,false,0)
	end)
end)

RegisterNUICallback('ammo', function(data)
	CreateThread(function()
		local ammotype = data.hash
		local dataamount = tonumber(data.amount)
		local amount = dataamount % 1 >= 0.5 and math.ceil(dataamount) or math.floor(dataamount)
		local currentammo = GetPedAmmoByType(PlayerPedId(),GetHashKey(ammotype))
		SetPedAmmoByType(PlayerPedId(),GetHashKey(ammotype),currentammo+amount)
	end)
end)

RegisterNUICallback('close', function()
	SendNUIMessage({showmenu = false})
	SetNuiFocus(false)
end)

local hashlist = {
	"WEAPON_MELEE_KNIFE_BEAR", --Antler Knife (Bear)
	"WEAPON_MELEE_BROKEN_SWORD", --Broken Pirate Sword
	"WEAPON_MELEE_KNIFE_CIVIL_WAR", --Civil War Knife
	"WEAPON_MELEE_CLEAVER", --Cleaver
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT", --Double Bit Hatchet
	"WEAPON_MELEE_HATCHET", --Hatchet
	"WEAPON_MELEE_HATCHET_HEWING", --Hewing Hatchet
	"WEAPON_MELEE_HATCHET_HUNTER", --Hunter Hatchet
	"WEAPON_MELEE_KNIFE", --Hunter Knife
	"WEAPON_MELEE_KNIFE_JAWBONE", --Jawbone Knife
	"WEAPON_MELEE_KNIFE_JOHN", --John's Knife
	"WEAPON_MELEE_MACHETE", --Machete
	"WEAPON_MELEE_KNIFE_VAMPIRE", --Ornate Dagger (Vampire Knife)
	"WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED", --Rusted Double Bit Hatchet
	"WEAPON_MELEE_HATCHET_HUNTER_RUSTED", --Rusted Hunter Hatchet
	"WEAPON_MELEE_ANCIENT_HATCHET", --Stone Hatchet
	"WEAPON_MELEE_HATCHET_VIKING", --Viking Hatchet
	"WEAPON_MELEE_KNIFE_MINER", --Wide-Blade Knife (Miner)
	"WEAPON_REVOLVER_CATTLEMAN", --Cattleman
	"WEAPON_REVOLVER_CATTLEMAN_JOHN", --John's Cattleman
	"WEAPON_REVOLVER_CATTLEMAN_MEXICAN", --Flaco's Cattleman (Mexican)
	"WEAPON_REVOLVER_CATTLEMAN_PIG", --Granger's Cattleman (Pig)
	"WEAPON_REVOLVER_DOUBLEACTION", --Double-Action
	"WEAPON_REVOLVER_DOUBLEACTION_EXOTIC", --Algernon's Double-Action (Exotic)
	"WEAPON_REVOLVER_DOUBLEACTION_GAMBLER", --High Roller Double-Action (Gambler)
	"WEAPON_REVOLVER_DOUBLEACTION_MICAH", --Micah's Double-Action
	"WEAPON_REVOLVER_LEMAT", --LeMat
	"WEAPON_REVOLVER_SCHOFIELD", --Schofield
	"WEAPON_REVOLVER_SCHOFIELD_CALLOWAY", --Calloway's Schofield
	"WEAPON_REVOLVER_SCHOFIELD_GOLDEN", --Otis Miller's Schofield (Golden)
	"WEAPON_PISTOL_M1899", --M1899
	"WEAPON_PISTOL_MAUSER", --Mauser
	"WEAPON_PISTOL_MAUSER_DRUNK", --Midnight's Mauser (Drunk)
	"WEAPON_PISTOL_SEMIAUTO", --Semi Automatic
	"WEAPON_PISTOL_VOLCANIC", --Volcanic
	"WEAPON_SHOTGUN_DOUBLEBARREL", --Double-Barreled
	"WEAPON_SHOTGUN_PUMP", --Pump Action
	"WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC", --Rare Double-Barreled (Exotic)
	"WEAPON_SHOTGUN_REPEATING", --Repeating
	"WEAPON_SHOTGUN_SAWEDOFF", --Sawed-Off
	"WEAPON_SHOTGUN_SEMIAUTO", --Semi Automatic
	"WEAPON_RIFLE_BOLTACTION", --Bolt Action Rifle
	"WEAPON_REPEATER_CARBINE", --Carbine Repeater
	"WEAPON_SNIPERRIFLE_CARCANO", --Carcano Sniper Rifle
	"WEAPON_REPEATER_EVANS", --Evans Repeater
	"WEAPON_REPEATER_HENRY", --Litchfield Repeater (Henry)
	"WEAPON_REPEATER_WINCHESTER", --Lancaster Repeater (Winchester)
	"WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC", --Rare Rolling Block Sniper Rifle (Exotic)
	"WEAPON_SNIPERRIFLE_ROLLINGBLOCK", --Rolling Block Sniper Rifle
	"WEAPON_RIFLE_SPRINGFIELD", --Springfield Rifle
	"WEAPON_RIFLE_VARMINT", --Varmint Rifle
	"WEAPON_BOW", --Bow
	"WEAPON_MOONSHINEJUG", --Moonshine Jug
	"WEAPON_THROWN_TOMAHAWK_ANCIENT", --Ancient Tomahawk
	"WEAPON_THROWN_DYNAMITE", --Dynamite
	"WEAPON_THROWN_MOLOTOV", --Molotov
	"WEAPON_THROWN_THROWING_KNIVES", --Throwing Knives
	"WEAPON_THROWN_TOMAHAWK", --Tomahawk
}

local ammohashlist = {
	"AMMO_REVOLVER", --Revolver
	"AMMO_REVOLVER_EXPRESS", --Express Revolver
	"AMMO_REVOLVER_EXPRESS_EXPLOSIVE", --Express Explosive Revolver
	"AMMO_REVOLVER_HIGH_VELOCITY", --High Velocity Revolver
	"AMMO_REVOLVER_SPLIT_POINT", --Split Point Revolver
	"AMMO_PISTOL", --Pistol
	"AMMO_PISTOL_EXPRESS", --Express Pistol
	"AMMO_PISTOL_EXPRESS_EXPLOSIVE", --Express Explosive Pistol
	"AMMO_PISTOL_HIGH_VELOCITY", --High Velocity Pistol
	"AMMO_PISTOL_SPLIT_POINT", --Split Point Pistol
	"AMMO_SHOTGUN", --Shotgun
	"AMMO_SHOTGUN_BUCKSHOT_INCENDIARY", --Shotgun Buckshot Incendiary
	"AMMO_SHOTGUN_EXPRESS_EXPLOSIVE", --Express Explosive Shotgun
	"AMMO_SHOTGUN_SLUG", --Shotgun Slug
	"AMMO_RIFLE", --Rifle
	"AMMO_RIFLE_EXPRESS", --Express Rifle
	"AMMO_RIFLE_EXPRESS_EXPLOSIVE", --Express Explosive Rifle
	"AMMO_RIFLE_HIGH_VELOCITY", --High Velocity Rifle
	"AMMO_RIFLE_SPLIT_POINT", --Split Point Rifle
	"AMMO_RIFLE_VARMINT", --Varmint Rifle
	"AMMO_REPEATER", --Repeater
	"AMMO_REPEATER_EXPRESS", --Express Repeater
	"AMMO_REPEATER_EXPRESS_EXPLOSIVE", --Express Explosive Repeater
	"AMMO_REPEATER_HIGH_VELOCITY", --High Velocity Repeater
	"AMMO_DYNAMITE", --Dynamite
	"AMMO_DYNAMITE_VOLATILE", --Volatile Dynamite
	"AMMO_MOLOTOV", --Molotov
	"AMMO_MOLOTOV_VOLATILE", --Volatile Molotov
	"AMMO_THROWING_KNIVES", --Throwing Knife
	"AMMO_THROWING_KNIVES_IMPROVED", --Improved Throwing Knife
	"AMMO_THROWING_KNIVES_POISON", --Poison Throwing Knife
	"AMMO_TOMAHAWK", --Tomahawk
	"AMMO_TOMAHAWK_HOMING", --Homing Tomahawk
	"AMMO_TOMAHAWK_IMPROVED", --Improved Tomahawk
	"AMMO_ARROW", --Arrow
	"AMMO_ARROW_DYNAMITE", --Dynamite Arrow
	"AMMO_ARROW_FIRE", --Fire Arrow
	"AMMO_ARROW_IMPROVED", --Improved Arrow
	"AMMO_ARROW_POISON", --Poison Arrow
	"AMMO_ARROW_SMALL_GAME", --Small Game Arrow
}

RegisterNUICallback('removeallweapons', function()
	CreateThread(function()
		RemoveAllPedWeapons(PlayerPedId(),true,true)
		datatext = "All Weapons Removed"
		DrawTextWait()
	end)
end)

RegisterNUICallback('removecurrentweapon', function()
	CreateThread(function()
		local retval, hash = GetCurrentPedWeapon(PlayerPedId(),true--[[bool--]],0--[[int--]],true--[[bool--]])
		RemoveWeaponFromPed(PlayerPedId(),hash,true,hash)
		datatext = "Current Weapon Removed"
		DrawTextWait()
	end)
end)

RegisterNUICallback('maxammo', function()
	CreateThread(function()
		for i, ammohash in ipairs(ammohashlist) do
			SetPedAmmoByType(PlayerPedId(),GetHashKey(ammohash),10000)
		end
		datatext = "Max Ammo for All Weapons"
		DrawTextWait()
	end)
end)

local infinite = 0
RegisterNUICallback('infinite', function()
	CreateThread(function()
		if infinite == 0 then
			for i, hash in ipairs(hashlist) do
				SetPedInfiniteAmmo(PlayerPedId(),true,GetHashKey(hash))
			end
			datatext = "Infinite Ammo Enabled"
			DrawTextWait()
			infinite = 1
		elseif infinite == 1 then
			for i, hash in ipairs(hashlist) do
				SetPedInfiniteAmmo(PlayerPedId(),false,GetHashKey(hash))
			end
			datatext = "Infinite Ammo Disabled"
			DrawTextWait()
			infinite = 0
		end
	end)
end)

local infiniteinclip = 0
RegisterNUICallback('infiniteinclip', function()
	CreateThread(function()
		if infiniteinclip == 0 then
			SetPedInfiniteAmmoClip(PlayerPedId(),true)
			datatext = "Infinite Ammo In Clip Enabled"
			DrawTextWait()
			infiniteinclip = 1
		elseif infiniteinclip == 1 then
			SetPedInfiniteAmmoClip(PlayerPedId(),false)
			datatext = "Infinite Ammo In Clip Disabled"
			DrawTextWait()
			infiniteinclip = 0
		end
	end)
end)

local showimpacts = false
local impacts = 0
RegisterNUICallback('showimpacts', function()
	CreateThread(function()
		if impacts == 0 then
			showimpacts = true
			datatext = "Impacts Enabled"
			DrawTextWait()
			impacts = 1
		elseif impacts == 1 then
			showimpacts = false
			datatext = "Impacts Disabled"
			DrawTextWait()
			impacts = 0
		end
	end)
end)

local showdamagedentities = false
local damagedentities = 0
RegisterNUICallback('showdamagedentities', function()
	CreateThread(function()
		if damagedentities == 0 then
			showdamagedentities = true
			datatext = "Damaged Entity Markers Enabled"
			DrawTextWait()
			damagedentities = 1
		elseif damagedentities == 1 then
			showdamagedentities = false
			datatext = "Damaged Entity Markers Disabled"
			DrawTextWait()
			damagedentities = 0
		end
	end)
end)

function GetEntityInView()
	local RotateX,RotateY,RotateZ = table.unpack(GetGameplayCamRot())
	local CoordX,CoordY,CoordZ = table.unpack(GetGameplayCamCoord())

	local MathRotateX = -math.sin((math.pi / 180) * RotateZ) * math.abs(math.cos((math.pi / 180) * RotateX))
	local MathRotateY = math.cos((math.pi / 180) * RotateZ) * math.abs(math.cos((math.pi / 180) * RotateX))
	local MathRotateZ = math.sin((math.pi / 180) * RotateX)
	
	local EndCoordX = CoordX + MathRotateX * 10000.0
	local EndCoordY = CoordY + MathRotateY * 10000.0
	local EndCoordZ = CoordZ + MathRotateZ * 10000.0
	
	local retval,hit,endCoords,surfaceNormal,entityHit = GetShapeTestResult(StartShapeTestRay(CoordX,CoordY,CoordZ,EndCoordX,EndCoordY,EndCoordZ, -1, -1, 1))
	if entityHit > 0 then
		return entityHit
	else
		return nil
	end
end

function DrawText(text)
	SetTextScale(0.35,0.35)
	SetTextColor(255,255,255,255)--r,g,b,a
	SetTextCentre(true)--true,false
	SetTextDropshadow(1,0,0,0,200)--distance,r,g,b,a
	SetTextFontForCurrentCommand(0)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text),0.5,0.5)
end

function DrawTextWait()
	toggletext = not toggletext
	Wait(1000)
	toggletext = not toggletext
end

CreateThread( function()
	while true do
		Wait(0)
		if toggletext then
			DrawText(tostring(datatext))
		end
	end
end)

function Draw3DText(text,x,y,z)
	local retval,screenX,screenY = GetScreenCoordFromWorldCoord(x,y,z)
	SetTextScale(0.35,0.35)
	SetTextColor(0,255,255,255)--r,g,b,a
	SetTextCentre(true)--true,false
	SetTextDropshadow(1,0,0,0,200)--distance,r,g,b,a
	SetTextFontForCurrentCommand(0)
	DisplayText(CreateVarString(10, "LITERAL_STRING", text),screenX,screenY)
end

local impactlist = {}
local impactlisti = 1
CreateThread( function()
	while true do        
		Wait(0)
		if showimpacts then
			local retval,coords = GetPedLastWeaponImpactCoord(PlayerPedId())
			if retval then
				local x,y,z = table.unpack(coords)
				impactlist[impactlisti] = {x,y,z}
				impactlisti = impactlisti+1
			end
		end
	end
end)

CreateThread( function()
	while true do        
		Wait(0)
		if showimpacts then
			for i, hit in ipairs(impactlist) do
				Draw3DText("O",hit[1],hit[2],hit[3])
			end
		end
	end
end)

local damagedentitieslist = {}
local damagedentitieslisti = 1
CreateThread( function()
	while true do        
		Wait(0)
		if showdamagedentities and IsPedShooting(PlayerPedId()) then
			local entityhit = GetEntityInView()
			if ((entityhit ~= nil) or (entityhit ~= PlayerPedId())) then
				damagedentitieslist[damagedentitieslisti] = entityhit
				damagedentitieslisti = damagedentitieslisti+1
			end
		end
	end
end)

CreateThread( function()
	while true do        
		Wait(0)
		if showdamagedentities then
			for i, hit in ipairs(damagedentitieslist) do
				local x,y,z = table.unpack(GetEntityCoords(hit))
				if ((tostring(x) == "0.0") and (tostring(y) == "0.0") and (tostring(z) == "0.0")) then
				else
					Draw3DText("X",x,y,z)
				end
			end
		end
	end
end)