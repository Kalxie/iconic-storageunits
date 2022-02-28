RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    if data.sv_event == true then 
        TriggerServerEvent(data.event, data.args)
    else
        TriggerEvent(data.event, data.args)
    end 

    cb('ok')
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
end)

RegisterNUICallback("cancel", function()
    SetNuiFocus(false)

    -- Events that are required to do smothing on menu close!
    TriggerEvent('garges:force:clear')
    exports['iconic-garages']:DeleteViewedCar()


    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
end)


RegisterNetEvent('iconic-context:sendMenu', function(data)
    if not data then return end
    SetNuiFocus(true, true)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })
end)

RegisterNetEvent('iconic-context:closemenu', function()
    SetNuiFocus(false, false)
    PlaySoundFrontend(-1, 'Highlight_Cancel','DLC_HEIST_PLANNING_BOARD_SOUNDS', 1)
    SendNUIMessage({
        action = "CLOSE_MENU",
        data = data
    })
end)