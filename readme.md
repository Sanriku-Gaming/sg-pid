# SG PID
A simple and minimalistic player ID HUD for FiveM servers.

## Features
- Displays the player's server ID in a small, unobtrusive container.
- Allows toggling the visibility of the HUD.
- Supports moving the HUD horizontally across the screen.
- Saves and loads the display state and position using localStorage.
- Fades in and out smoothly when toggled.
- Resets the position of the HUD with a keybind.

## Requirements
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [ox_lib](https://github.com/overextended/ox_lib/releases)

## Installation
1. Download the latest version of the resource.
2. Place the `sg-pid` folder in your server's `resources` directory.
3. Add `ensure sg-pid` to your `server.cfg` file.
4. Configure the keybinds in the `client.lua` file if desired.
5. Customize the styling of the HUD in the `style.css` file if needed.
6. Restart your server.

## Usage
- The player ID HUD is enabled by default when a player connects to the server.
- Players can toggle the visibility of the HUD by pressing the designated keybind (default: `F9`).
- Players can move the HUD horizontally by holding the `SHIFT` key and pressing the designated keybind (default: `F9`).
  - While moving the HUD, players can click to position it or press `ESCAPE` to stop moving.
- The display state and position of the HUD are automatically saved and loaded using localStorage.

### Exports
```lua
-- Toggles the visibility of the HUD
exports['sg-pid']:ToggleHud(bool)
```
- bool: true to show the HUD, false to hide the HUD.
 - This export can be used to programmatically toggle the visibility of the HUD if needed.

```lua
exports['sg-pid']:isHudActive()
```
- Returns the current display state of the HUD
 - Returns true if the HUD is currently visible, false otherwise.
 - This export can be used to check the current display state of the HUD.

## Preview

![SG PID Preview](assets/preview.png)

## Credits
- Created by: [Nicky](https://forum.cfx.re/u/Sanriku)
- [SG Scripts Discord](https://discord.gg/uEDNgAwhey)