function ToggleUI(isOpen)
    SetNuiFocus(isOpen, isOpen)
    SendNUIMessage({ action = 'setVisible', payload = isOpen })
end

RegisterNUICallback('post:closeUi', function(_, cb)
    ToggleUI(false)
    SetNuiFocus(false, false)

    return cb(true)
end)

RegisterNUICallback('get:colors', function(_, cb)
    cb({
        primaryColor = "#8000FF",   -- HEX ou RGB/RGBA
        secondaryColor = "#8000FF", -- HEX ou RGB/RGBA
        thirdyColor = "#8000FF",    -- HEX ou RGB/RGBA
    })
end)

RegisterCommand('openUI', function()
    ToggleUI(true)
end, false)
