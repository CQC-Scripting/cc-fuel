function CanPumpRefuelPetrolCan()
	local petrolCan = GetCurrentGasCanDurability()
	if petrolCan == nil then return false end
	if petrolCan >= 100 then return false end
	return true
end

--Checks if the supplied vehicle can have fuel siphoned from it
function IsSiphonFuelAllowed(vehicle)
	if GetVehicleEngineHealth(entity) <= 0 then return false end
    if isFueling then return false end
            
	local curGasCanDurability = GetCurrentGasCanDurability()
    
	if curGasCanDurability == nil then return false end
    if curGasCanDurability >= 100 then return false end
            
    return Config.AllowFuelSiphoning
end

--Checks if the vehicle passed in can be refuelled by petrol can
function IsPetrolCanRefuelAllowed(vehicle)
	if GetVehicleEngineHealth(entity) <= 0 then return false end
	if isFueling then return false end

	local curGasCanDurability = GetCurrentGasCanDurability()
    if curGasCanDurability == nil then return false end
    if curGasCanDurability <= 0 then return false end

	return Config.AllowPetrolCanRefuelCar
end

--If the player has a gas can equiped it gets the durability of the can
--nil if no can is equiped
function GetCurrentGasCanDurability()
	local ammo = GetAmmoInPedWeapon(PlayerPedId(), `weapon_petrolcan`)
	local weapon, hash = GetCurrentPedWeapon(PlayerPedId())
	local percentageFull = (ammo / 4000) * 100
	if weapon then
		return percentageFull
		-- if hash == `weapon_petrolcan` then
		-- 	-- if ammo > 4000 then
		-- 	-- 	print("Ammo over 4000") 
		-- 	-- 	ammo = 4000
		-- 	-- 	SetPedAmmo(PlayerPedId(), `weapon_petrolcan`, ammo)
		-- 	-- 	ammo = GetAmmoInPedWeapon(PlayerPedId(), `weapon_petrolcan`)
		-- 	-- end
			
		-- 	return percentageFull
		-- else
		-- 	return nil
		-- end
	else
		return nil
	end
end

--Sets the ammo contained the petrol can
function SetPetrolCanDurability(percentageFull)
	if percentageFull > 100 then percentageFull = 100 end
	if percentageFull < 0 then percentageFull = 0 end

	local ammo = (4000 / 100) * percentageFull
	if ammo > 4000 then ammo = 100 end
	if ammo < 0 then ammo = 0 end
	SetPedAmmo(PlayerPedId(),`weapon_petrolcan`,ammo)
	TriggerServerEvent("weapons:server:UpdateWeaponAmmo",CurrentWeaponData,ammo)
end

--Returns true if the vehicle passed in is able to be fueled
function CanFuelVehicle(Vehicle)
    if Vehicle then
        local fuelLevel = GetFuel(Vehicle)
        
        if fuelLevel == 100 then
            return false
        end
        return true
    end
    return false
end

function GetFuel(vehicle)
	if vehicle == 0 or vehicle == nil then return 0 end
	return DecorGetFloat(vehicle, Config.FuelDecor)
end

function SetFuel(vehicle, fuel)
	if vehicle == 0 or vehicle == nil then print("nil vehicle") return end
	if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
		SetVehicleFuelLevel(vehicle, fuel)
		DecorSetFloat(vehicle, Config.FuelDecor, fuel + 0.0)
	end
end

function LoadAnimDict(dict)
	if not HasAnimDictLoaded(dict) then
		RequestAnimDict(dict)

		while not HasAnimDictLoaded(dict) do
			Wait(1)
		end
	end
end

function DrawText3Ds(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)

	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

function Round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)

	return math.floor(num * mult + 0.5) / mult
end


function CreateBlip(coords)
	local blip = AddBlipForCoord(coords)

	SetBlipSprite(blip, 361)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 4)
	SetBlipDisplay(blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Gas Station")
	EndTextCommandSetBlipName(blip)

	return blip
end

function GetGasPumpModels()
	return Config.GasPumpModels
end

function FindNearestFuelPump()
	local coords = GetEntityCoords(PlayerPedId())
	local fuelPumps = {}
	local handle, object = FindFirstObject()
	local success

	repeat
		if Config.PumpModels[GetEntityModel(object)] then
			table.insert(fuelPumps, object)
		end

		success, object = FindNextObject(handle, object)
	until not success

	EndFindObject(handle)

	local pumpObject = 0
	local pumpDistance = 1000

	for _, fuelPumpObject in pairs(fuelPumps) do
		local dstcheck = #(coords - GetEntityCoords(fuelPumpObject))

		if dstcheck < pumpDistance then
			pumpDistance = dstcheck
			pumpObject = fuelPumpObject
		end
	end

	return pumpObject, pumpDistance
end
