ESX = nil
ESX = exports['es_extended']:getSharedObject(function(obj) ESX = obj end)

RegisterServerEvent('Joke_Woobjob:Getitem')
AddEventHandler('Joke_Woobjob:Getitem', function(Zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

		xPlayer.addInventoryItem(Zone.Items[1].Get.ItemName, Zone.Items[1].Get.ItemCount)
		
	--Bonus
	if Zone.Items[1].Get.Bonus ~= nil then

		local table = { 
			Zone.Items[1].Get.Bonus[1]v.ItemName, v.ItemCount, 
			Zone.Items[1].Get.Bonus[2]v.ItemName, v.ItemCount, 
			Zone.Items[1].Get.Bonus[3]v.ItemName, v.ItemCount
		} 

		local rand = math.random(1~3) 
	
			xPlayer.addInventoryItem(v.ItemName, v.ItemCount)

	end
end)

