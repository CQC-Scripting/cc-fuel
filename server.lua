QBCore = nil
--New QBCore way of getting the Object comment out if your using old QB
QBCore = exports['qb-core']:GetCoreObject()

--Old way kept for old QBCore users uncomment if you use old QB
--Citizen.CreateThread(function()
--	while QBCore == nil do
--      TriggerEvent("QBCore:GetObject", function(obj)QBCore = obj end)
--	end
--end

RegisterNetEvent("cc-fuel:server:pay")
AddEventHandler("cc-fuel:server:pay", function(price,source) 
    local xPlayer = QBCore.Functions.GetPlayer(source)
	local amount = math.floor(price)

	if price > 0 then
		print("Removing cash for " .. source .. " amount " .. amount)
		xPlayer.Functions.RemoveMoney('cash', amount)
	end
end)
