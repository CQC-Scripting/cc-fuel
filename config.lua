Config = {}

-- What should the price of jerry cans be?
Config.JerryCanCost = 100

-- What keys are disabled while you're fueling.
Config.DisableKeys = {0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323}

-- Modify the fuel-cost here, using a multiplier value. Setting the value to 2.0 would cause a doubled increase.
Config.CostMultiplier = 1.5

-- Configure the strings as you wish here.
Config.Strings = {
	CancelFuelingPump = "Press ~g~E ~w~to cancel the fueling",
	CancelFuelingJerryCan = "Press ~g~E ~w~to cancel the fueling",
	CancelSiphoningFuel = "Press ~g~E ~w~ to cancel siphoning fuel"
}

-- Blacklist certain vehicles. Use names or hashes. https://wiki.gtanet.work/index.php?title=Vehicle_Models
Config.Blacklist = {
	--"Adder",
	--276773164
}

-- Do you want the HUD removed from showing in blacklisted vehicles?
Config.RemoveHUDForBlacklistedVehicle = true

-- Class multipliers. If you want SUVs to use less fuel, you can change it to anything under 1.0, and vise versa.
Config.Classes = {
	[0] = 1.0, -- Compacts
	[1] = 1.0, -- Sedans
	[2] = 1.0, -- SUVs
	[3] = 1.0, -- Coupes
	[4] = 1.0, -- Muscle
	[5] = 1.0, -- Sports Classics
	[6] = 1.0, -- Sports
	[7] = 1.0, -- Super
	[8] = 1.0, -- Motorcycles
	[9] = 1.0, -- Off-road
	[10] = 1.0, -- Industrial
	[11] = 1.0, -- Utility
	[12] = 1.0, -- Vans
	[13] = 0.0, -- Cycles
	[14] = 1.0, -- Boats
	[15] = 1.0, -- Helicopters
	[16] = 1.0, -- Planes
	[17] = 1.0, -- Service
	[18] = 1.0, -- Emergency
	[19] = 1.0, -- Military
	[20] = 1.0, -- Commercial
	[21] = 1.0, -- Trains
}

-- The left part is at percentage RPM, and the right is how much fuel (divided by 10) you want to remove from the tank every second
Config.FuelUsage = {
	[1.0] = 1.4,
	[0.9] = 1.2,
	[0.8] = 1.0,
	[0.7] = 0.9,
	[0.6] = 0.8,
	[0.5] = 0.7,
	[0.4] = 0.5,
	[0.3] = 0.4,
	[0.2] = 0.2,
	[0.1] = 0.1,
	[0.0] = 0.0,
}

Config.GasPumpModels = {
	"prop_gas_pump_1d",
    "prop_gas_pump_1a",
    "prop_gas_pump_1b",
    "prop_gas_pump_1c",
    "prop_vintage_pump",
    "prop_gas_pump_old2",
    "prop_gas_pump_old3"
}

--Fueling rates, higher numbers = faster fueling

--The rate at which fuel can be siphoned from a tank
Config.SiphonRate = 0.25
--The rate at which a petrol can will refuel a car
Config.PetrolCanRefuelRate = 0.50
--The rate at which a pump will refuel a car
Config.PetrolPumpRefuelRate = 0.75

--Controls whether or not the vehicle will blow up if a refuel is attempted with engine on
Config.VehicleEngineOnBlowUp = true
--Percentage chance that the vehicle will blow up if a refuel is attempted with engine on
Config.VehicleBlowUpChance = 25


--Allows people to siphon fuel from other vehicles into their petrol cans
Config.AllowFuelSiphoning = true

--Allows people to refuel their cars with a petrol can that has fuel in it
Config.AllowPetrolCanRefuelCar = true

