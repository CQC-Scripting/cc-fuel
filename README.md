# cc-fuel
Re write of LegacyFuel for QB-Core using qb-target for interactions
Full credit goes to the author of LegacyFuel, I just reworked it to fit better with qb-target

<h2>Installation</h2>

Drop the cc-fuel folder into your server resources folder

Remove LegacyFuel from your [standalone] folder
Add "start cc-fuel" to your server.cfg

<h2>Note</h2>

Any scripts that use the LegacyFuel export should be changed to use the cc-fuel export instead

exports['LegacyFuel']:GetFuel(vehicle) = exports['cc-fuel']:GetFuel(vehicle)

To get the HUD fuel indicator working again replace the GetFuel export in qb-hud

<h2>Images</h2>

![image](https://user-images.githubusercontent.com/46245557/135166635-562cf4fe-491c-4120-9bc0-dd7c919a3c00.png)

![image](https://user-images.githubusercontent.com/46245557/135167090-6e8db7e8-e0f3-4152-b1ce-10d0a231680b.png)

Original Repo - https://github.com/qbcore-framework/LegacyFuel

qb-target - https://github.com/BerkieBb/qb-target