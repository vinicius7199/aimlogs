local webhookaim = 'WEBHOOKHERE'

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

RegisterServerEvent('aimlogs:log')
AddEventHandler('aimlogs:log', function(target)
	local _source = source
	TriggerEvent("redemrp:getPlayerFromId",source,function (player)
    local identifier = player.getIdentifier()
	local fname = player.getFirstname()
	local lname = player.getLastname()
	
			TriggerEvent("redemrp:getPlayerFromId",target,function (user)
			if user ~= nil then
				local u_identifier = user.getIdentifier()
				local u_fname = user.getFirstname()
				local u_lname = user.getLastname()
				SendWebhookMessage(webhookaim, "```prolog\n[STEAM]: "..identifier.."\n[NOME]: "..fname.." "..lname.."\n[MIRANDO EM]: \n[STEAM]: "..u_identifier.."\n[NOME]: "..u_fname.." "..u_lname..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end)
	end)
end)