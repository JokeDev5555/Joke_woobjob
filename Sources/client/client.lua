local IsProcessing, IsOpenMenu = false, false

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		ESX = exports['es_extended']:getSharedObject(function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
end)

function ProcessObject(Zone)
	IsProcessing = true
	if Zone.minigame == 1 then
		local minigame1 = startminigame1(Zone)
		if minigame1 == 100 then
			TriggerServerEvent("Joke_Woobjob:Getitem",Zone)
			IsProcessing = false
		else
			IsProcessing = false
		end
	else
		local finished1 = exports["reload-skillbar"]:taskBar(3000,math.random(5,15))
		local playerPed = PlayerPedId()
		
		if finished1 == 100 then
			
			local finished2 = exports["reload-skillbar"]:taskBar(3000,math.random(5,15))
			if finished2 == 100 then
				
				local finished3 = exports["reload-skillbar"]:taskBar(3000,math.random(5,15))
				if finished3 == 100 then
					TriggerServerEvent("Joke_Woobjob:Getitem",Zone)
					IsProcessing = false
					ClearPedTasks(playerPed)
				else
					IsProcessing = false
					ClearPedTasks(playerPed)
				end
			else
				IsProcessing = false
				ClearPedTasks(playerPed)
			end
		else
			IsProcessing = false
			ClearPedTasks(playerPed)
		end
	end
end

function startminigame1(Zone)

	local Result = exports['xzero_skillcheck']:startGameSync({
		textTitle           = "อ่านหนังสือ",                         -- ข้อความที่แสดง
		speedMin            = 15,                                 -- ความเร็วสุ่มตั้งแต่เท่าไหร่  (ยิ่งน้อยยิ่งเร็ว)
		speedMax            = 20,                                 -- ความเร็วสุ่มถึงเท่าไหร่    (ยิ่งน้อยยิ่งเร็ว)
		countSuccessMax     = Zone.minigame_true_time,            -- กำหนดจำนวนครั้งที่สำเร็จ (เมื่อถึงเป้าจะ success)
		countFailedMax      = Zone.minigame_false_time,           -- กำหนดจำนวนครั้งที่ล้มเหลว (เมื่อถึงเป้าจะ failed)
		layOut              = 'bottom',                           -- ตำแหน่งที่แสดง | center กลาง | bottom ล่าง | top บน
		freezePos           = true,                               -- true = ล็อคตำแหน่งผู้เล่นไม่ให้ขยับ
		playScenario        = Zone.Animation,                     -- เล่นอนิเมชั่นประเภท TaskStartScenarios
		playAnim            =  {                                  -- เล่นอนิเมชั่นประเภท TaskPlayAnim
			Dict = Zone.AnimationDirect,                          -- Anim Dictionary
			Name = Zone.Animation                                 -- Anim Name
		}
	})
	if Result.status then
		return 100
	else
		return 0
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		local _Config = Config.Zone
		local IsInMarkerProcess  = false
		local CurrentZone = nil
		local CurrentTextHelper = nil

		for k,v in pairs(Config.Zone) do
			if(GetDistanceBetweenCoords(coords, v.Marker.Pos.x, v.Marker.Pos.y, v.Marker.Pos.z, true) < v.Marker.distant) then
				IsInMarkerProcess  = true
				CurrentZone = v
				CurrentTextHelper = v.Text.TextHelper
				drawText3D(vector3(v.Marker.Pos.x, v.Marker.Pos.y, v.Marker.Pos.z), (CurrentTextHelper))
			end
		end
		
		if IsInMarkerProcess and not IsProcessing and not IsOpenMenu then
			
			if IsControlJustPressed(0, 38) then

				ProcessObject(CurrentZone)
				IsOpenMenu = false
			end
		end
	end
end)

drawText3D = function(coords, text)
	local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
	SetTextScale(0.5, 0.5)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
  
	AddTextComponentString(text)
	DrawText(_x, _y)
end