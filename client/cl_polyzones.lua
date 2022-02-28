near_storage_unit = false
showStorageUnits = false
storage_units_data = {}
currently_visiting_unit = 0

local storage_units_loc = {
    {583.95208740234, -1893.7155761719, 25.105409622192},
    {-66.458686828613, -1234.4520263672, 28.961671829224}
}

Citizen.CreateThread(function()
    local storage_units = remoteCalls.execute("iconic-storageunits:get")
    for i = 1, #storage_units do
   
        exports["iconic-polyzone"]:AddBoxZone(storage_units[i].storage_name, vector3(storage_units[i].coords.x, storage_units[i].coords.y, storage_units[i].coords.z), storage_units[i].coords.width, storage_units[i].coords.height, {
            name= storage_units[i].storage_name,
            heading = storage_units[i].coords.h,
            minZ= storage_units[i].coords.minZ,
            maxZ= storage_units[i].coords.maxZ
        })

        local storage_data = {
            storage_id = storage_units[i].storage_id,
            storage_name = storage_units[i].storage_name
        }

        table.insert(storage_units_data, storage_data)
    end
end)


RegisterNetEvent('iconic-polyzone:enter')
AddEventHandler('iconic-polyzone:enter', function(name)
    for i = 1, #storage_units_data do
        if (name == storage_units_data[i].storage_name) then
            near_storage_unit = true
            storage_unit_thread()
            currently_visiting_unit = storage_units_data[i].storage_id
            TriggerEvent('iconic-textui:ShowUI', 'show', "[E] Open storage unit "..currently_visiting_unit) 
        end
    end
end)


RegisterNetEvent('iconic-polyzone:exit')
AddEventHandler('iconic-polyzone:exit', function(name)
    for i = 1, #storage_units_data do
        if (name == storage_units_data[i].storage_name) then
            near_storage_unit = false
            currently_visiting_unit = 0
            TriggerEvent('iconic-textui:HideUI')
        end
    end
end)

function storage_unit_thread()
    Citizen.CreateThread(function()
        while near_storage_unit do
            Citizen.Wait(5)
            if IsControlJustReleased(0, 38) then
                remoteCalls.execute("iconic-storageunits:occupied", currently_visiting_unit)
            end
        end
    end)
end

RegisterNetEvent('iconic-storageunits:toggleblip', function()
   showStorageUnits = not showStorageUnits
   for _, item in pairs(storage_units_loc) do
        if not showStorageUnits then
            if item.blip ~= nil then
                RemoveBlip(item.blip)
            end
        else
            item.blip = AddBlipForCoord(item[1], item[2], item[3])
            SetBlipSprite(item.blip, 473)
            SetBlipScale(item.blip, 0.7)
            SetBlipAsShortRange(item.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Storage units")
            EndTextCommandSetBlipName(item.blip)
        end
    end
end)