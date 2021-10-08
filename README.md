![Banner](https://user-images.githubusercontent.com/89382232/135760706-97bc48d6-7c40-4b70-a0b7-779834173c85.png)

# CC-FUEL

CC-Fuel is a Modified version of LegacyFuel for QB-Core using QB-Target for Interactions.
<br>
Full credit goes to the author of LegacyFuel, I just reworked it to fit better with qb-target.

<h1>INSTALLATION GUIDE</h1>

1. Remove LegacyFuel from your [standalone] folder
2. Drop the cc-fuel folder into your [standalone] folder
3. Add fuelsiphon.png to QB-Inventory>html>images
4. Add The Following Line to QB-Core>Shared.lua

```lua
-- CC-Fuel
['fuelsiphon'] = {['name'] = 'fuelsiphon', ['label'] = 'Fuel Siphon', ['weight'] = 2500, ['type'] = 'item', ['image'] = 'fuelsiphon.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'A fuel siphon to extract fuel from vehicles'},
```

5. Add Fuel Siphon to a shop of your choice or anywhere else you want it.

<h1>FEATURES</h1>

- QB-Target Based Script
- Can Refill At All Gas Stations
- Refuel From Petrol Cans (Petrol Can Item Required On Person)
- Siphon Fuel From Cars (Fuel Siphon Item Required On Person)
- Added chance for car blowing Up if Engine left on while refueling


<h2>NOTE</h2>

**Any scripts that use the LegacyFuel export should be changed to use the cc-fuel export instead.**
<br>
- exports['LegacyFuel'] --> exports['cc-fuel']
<br>
To get the HUD fuel indicator working again replace the GetFuel export in qb-hud

<h2>IMAGES</h2>

![image](https://user-images.githubusercontent.com/46245557/135166635-562cf4fe-491c-4120-9bc0-dd7c919a3c00.png)
![Image1](https://user-images.githubusercontent.com/89382232/135759935-e459ef23-30c3-4e24-a9d1-293a6d12735c.png)


**CREDIT**
-----
Original Repo - https://github.com/qbcore-framework/LegacyFuel

**DEPENDENCIES**
-----

- QBCore - https://github.com/qbcore-framework
- QB-Target - https://github.com/BerkieBb/qb-target
