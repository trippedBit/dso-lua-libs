# Lua libs
Lua libraries for use in modifications for the videogame Darkstar One.
<br><br>
## License
Please see [LICENSE](LICENSE).
<br><br>
## Requirements
* Darkstar One 1.2 or later
<br><br>
## DebugLib.lua
Contains function for debugging during modification development.<br>
To enable debug mode, simply add the script DebugModeSwitchENABLE.lua to your scripts folder and accept the terminal mission "DebugModeSwitchENABLE".<br>
To disable debug mode, simply add the script DebugModeSwitchDISABLE.lua to your scripts folder and accept the terminal mission "DebugModeSwitchDISABLE".<br>
Both missions can be accepted multiple times to switch the mode as often as needed but it might be, you have to leave the trade station station to get the terminal mission table updated.
<br>
For further information, please see the function headers in the lua file.
<br><br>
## How to use the libraries
The libraries must be located in the "lua" folder which is located inside the Darkstar One installation folder.
You can either manually copy them or use one of the following PowerShell scripts.<br>
You might need administrator privilegs for successfull script execution.
<br><br>
### Using copy_libs.ps1
This script searches the installation directory in your Windows Registry and copies the libraries into the correct destination.
### Using link_libs.ps1
This script searches the installation directory in your Windows Registry and links the libraries into the correct destination.