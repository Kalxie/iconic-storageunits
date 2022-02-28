RegisterNetEvent('iconic-textui:ShowUI')
AddEventHandler('iconic-textui:ShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('iconic-textui:HideUI')
AddEventHandler('iconic-textui:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)