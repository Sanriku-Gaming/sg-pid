local QBCore = exports['qb-core']:GetCoreObject()
local display = true

-------------------------
---     Functions     ---
-------------------------

local function isHudActive()
  return display
end
exports('isHudActive', isHudActive)

--@param boolean | true/false to show/hide the display
local function ToggleHud(toggle)
  if display then
    SendNUIMessage({
      action = 'toggleDisplay',
      show = toggle
    })
  end
end
exports('ToggleHud', ToggleHud)

-------------------------
---     Commands      ---
-------------------------
lib.addKeybind({
  name = 'hud-toggle-move',
  description = 'Toggle/Move the mini hud',
  defaultKey = 'F9',
  onPressed = function(self)
    if IsControlPressed(1, 21) and display then
      SendNUIMessage({
        action = 'startMove',
        status = true
      })
      SetNuiFocus(true, true)
      QBCore.Functions.Notify('Click & Drag to move the hud. Escape to stop.', 'primary', 10000, 'fas fa-exclamation-circle')
    else
      display = not display
      SendNUIMessage({
        action = 'toggleDisplay',
        show = display
      })
      QBCore.Functions.Notify(display and 'Mini hud is now showing' or 'Mini hud is now hidden', 'primary', 5000, display and 'fas fa-eye' or 'fas fa-eye-slash')
    end
  end,
})

lib.addKeybind({
  name = 'hud-reset-pos',
  description = 'Reset mini hud position',
  defaultKey = 'F10',
  onPressed = function(self)
    local left = 20
    SendNUIMessage({
      action = 'setPosition',
      left = left,
    })
  end,
})

-------------------------
---   NUI Callbacks   ---
-------------------------
RegisterNUICallback('stopMove', function(data, cb)
  SetNuiFocus(false, false)
  cb({})
end)

RegisterNUICallback('setDisplayState', function(data, cb)
  display = data.displayState
  cb({})
end)

-------------------------
---    Base Events    ---
-------------------------
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function ()
  Wait(2000)
  id = QBCore.Functions.GetPlayerData().source
  Wait(500)
  SendNUIMessage({
    action = 'updatePID',
    id = id
  })
end)