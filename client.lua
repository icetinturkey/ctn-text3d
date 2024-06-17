nodes = {}

function Text3D(args)
	local textbox_length = 0.08
	if string.len(args.message)>7 then
		textbox_length = ((string.len(args.message) - 7) * 0.00667) + 0.08
	end
	local offset = 0.052 + ((math.floor(textbox_length/0.02) - 4) * 0.01)
	local red = Config.DefaultText3D.markerColor[1]
	local green = Config.DefaultText3D.markerColor[2]
	local blue = Config.DefaultText3D.markerColor[3]
	if args.r ~= nil and args.g ~= nil and args.b ~= nil then
		red = args.r
		green = args.g
		blue = args.b
	end
	local receivedevent = nil
	local receivedargs = {}
	if args.event ~= nil and args.values ~= nil then
		receivedevent = args.event
		receivedargs = args.values
	end
    nodes[#nodes + 1] = {
		id = args.id,
		coords = args.coords,
		key = args.key,
		message = args.message,
		msgboxlen = textbox_length,
		msgboxoff = offset,
		near = false,
		r = red,
		g = green,
		b = blue,
		event = receivedevent,
		value = receivedargs
    }
end

function DeleteText3D(id)
	newnodes = {}
	for k, v in pairs(nodes) do
		if v.id ~= id then
			newnodes[#newnodes + 1] = {
				id = v.id,
				coords = v.coords,
				key = v.key,
				message = v.message,
				msgboxlen = v.msgboxlen,
				msgboxoff = v.msgboxoff,
				near = v.near,
				r = v.r,
				g = v.g,
				b = v.b,
				event = v.event,
				value = v.value
			}
		end
	end
	nodes = {}
	nodes = newnodes
end


--ALL NODES
Citizen.CreateThread(function()
	RequestStreamedTextureDict("ctn_data")
	while not HasStreamedTextureDictLoaded("ctn_data") do
		Wait(1)
	end
	while true do
		for k, v in pairs(nodes) do
			local myCoords = GetEntityCoords(PlayerPedId())
			local distance = #(myCoords - v.coords)
			if distance < Config.DefaultText3D.markerDistance then
				v.near = true
			else
				v.near = false
			end
		end
		Citizen.Wait(2000)
	end
end)

--ONLY NEAR NODES
CreateThread(function()
    while true do
		for k, v in pairs(nodes) do
			if v.near == true then
				local myCoords = GetEntityCoords(PlayerPedId())
				local distance = #(myCoords - v.coords)
				if distance > Config.DefaultText3D.distance then
					SetDrawOrigin(v.coords.x,v.coords.y,v.coords.z)
					DrawSprite("ctn_data", "circle-preview",  0.0, 0.0, 0.028125, 0.05, 0.0, v.r, v.g, v.b, Config.DefaultText3D.markerColor[4])
					ClearDrawOrigin()
				else
					SetTextScale(0.6, 0.6)
					SetTextFont(4)
					SetTextDropShadow()
					SetTextProportional(1)
					SetTextColour(Config.DefaultText3D.textColor[1], Config.DefaultText3D.textColor[2], Config.DefaultText3D.textColor[3], Config.DefaultText3D.textColor[4])
					SetTextEntry("STRING")
					SetTextCentre(true)
					AddTextComponentString(v.key)
					SetDrawOrigin(v.coords.x,v.coords.y,v.coords.z)
					DrawText(0.0, -0.02)
					DrawSprite("ctn_data", "key-container",  0.0, 0.0, 0.028125, 0.05, 0.0, v.r, v.g, v.b, Config.DefaultText3D.markerColor[4])
					
					SetTextScale(0.4, 0.4)
					SetTextFont(4)
					SetTextDropShadow()
					SetTextProportional(1)
					SetTextColour(Config.DefaultText3D.textColor[1], Config.DefaultText3D.textColor[2], Config.DefaultText3D.textColor[3], Config.DefaultText3D.textColor[4])
					SetTextEntry("STRING")
					SetTextCentre(true)
					AddTextComponentString(v.message)
					SetDrawOrigin(v.coords.x,v.coords.y,v.coords.z)
					DrawText(v.msgboxoff, -0.015)
					DrawSprite("ctn_data", "message-container",  v.msgboxoff, 0.0, v.msgboxlen, 0.035, 0.0, v.r, v.g, v.b, Config.DefaultText3D.markerColor[4])
					ClearDrawOrigin()
					if v.event ~= nil then
						if IsControlJustPressed(0, Config.Keys[v.key]) then
							TriggerEvent(v.event, v.value)
						end
					end
				end
			end
		end
        Wait(2)
    end
end)