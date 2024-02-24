commands = {
    ["hyperscripts:addVip"] = function (args)
        local playerID = tonumber(args[1]);
        local exportResourceName = args[2]
        local vipName = args[3]
        local vipNumber = args[4]
        local vipDays = tonumber(args[5])

        local HSVIP = exports[exportResourceName]

        local player = getPlayerID(playerID);
        local playerAccount = getAccountName( getPlayerAccount( player ))

        HSVIP:givePremium(playerAccount, vipName, vipDays, 'Dias', 'VIP:0' .. vipNumber)
    end,
    ["hyperscripts:addCoin"] = function (args)
        local playerID = tonumber(args[1]);
        local elementData = args[2]
        local quantityCoin = tonumber(args[3]);
        
        local player = getPlayerID(playerID);
        local currentCoins = getElementData(player, elementData) or 0;

        setElementData(player, elementData, currentCoins + quantityCoin)
    end,
    ["hyperscripts:addVehicle"] = function (args)
        local playerID = tonumber(args[1]);
        local exportResourceName = args[2]
        local vehicleName = args[3]
        local vehicleModel = tonumber(args[4])
        local vehicleCategory = tonumber(args[5])
        local validate = tonumber(args[6])
        
        local player = getPlayerID(playerID);
        local account = getAccountName( getPlayerAccount( player ) )
        local conce = exports[exportResourceName]

        local verify = conce:getVehicle( account, vehicleName )
        if not verify then
            local plate = conce:generatePlate( )
            conce:setVehicleVip( account, vehicleName, plate, vehicleCategory, vehicleModel, validate )
        end
    end,
    ["testeItem"] = function (args)
        print(args[1])
    end
}