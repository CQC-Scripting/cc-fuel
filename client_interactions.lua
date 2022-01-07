CreateThread(function()

    exports['qb-target']:AddTargetBone(Config.PetrolCanRefuelBones,{ 
        options = {
            { 
                type = "client",
                event = 'cc-fuel:client:petrolcanrefuel',
                label = 'Refuel Car', 
                icon = 'fas fa-gas-pump',
                item = 'weapon_petrolcan',
                canInteract = function(entity)
                    if GetVehicleEngineHealth(entity) <= 0 then return false end
                    if isFueling == false then
                        local curGasCanDurability = GetCurrentGasCanDurability()
                        if curGasCanDurability == nil then return false end
                        if curGasCanDurability > 0 then return true end
                        return false
                    end
                    return false
                end
            },
        },
        distance = 2.5,
    })
    
    exports['qb-target']:AddTargetBone(Config.SiphonBones,{
        options = {
            {
                type="client",
                event="cc-fuel:client:siphonfuel",
                label = "Siphon Fuel",
                icon = 'fas fa-gas-pump',
                item = 'fuelsiphon',
                canInteract = function(entity)
                    if GetVehicleEngineHealth(entity) <= 0 then return false end
                    if isFueling then return false end
                    local curGasCanDurability = GetCurrentGasCanDurability()
                    if curGasCanDurability == nil then return false end
                    if curGasCanDurability >= 100 then return false end
                    
                    return Config.AllowFuelSiphoning
                end
            }
        },
        distance = 3.0,
    })
    
    exports['qb-target']:AddTargetModel(Config.GasPumpModels, {
        options = {
            {
                icon = "fas fa-gas-pump",
                label = "Get Fuel",
                action = function(entity)
                    TriggerEvent("cc-fuel:client:pumprefuel", entity)
                end
            },
            {
                type = "client",
                event = "cc-fuel:client:buypetrolcan",
                icon =  "fas fa-gas-pump",
                label = "Buy Petrol Can"
            },
            {
                type = "client",
                event = "cc-fuel:client:refillpetrolcan",
                icon =  "fas fa-gas-pump",
                label = "Refuel Petrol Can",
                canInteract = function(entity)
                    return CanPumpRefuelPetrolCan()
                end
            }
        },
        distance = 3.0
    })
    if Config.Blips then
        for k, v in pairs(Config.FuelStations) do
            FuelStationBlip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(FuelStationBlip, Config.BlipSpirte)
            SetBlipDisplay(FuelStationBlip, 2)
            SetBlipScale(FuelStationBlip, Config.BlipSize)
            SetBlipAsShortRange(FuelStationBlip, true)
            SetBlipColour(FuelStationBlip, Config.BlipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.BlipLabel)
            EndTextCommandSetBlipName(FuelStationBlip)
        end
    end
end)

AddEventHandler('onResourceStop',function(name) 
    if (GetCurrentResourceName() ~= name) then return end
end)