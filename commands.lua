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
        local exportsResource = args[2]
        local vehicle = string.gsub(args[3], "-", " ")
        
        local player = getPlayerID(playerID);
        local conce = exports[exportsResource];

        local vehicleConfig = conce:getVehicleVipConfig(vehicle);

        local verify = conce:getVehicle( account, vehicleName )
        if not verify then
            local plate = conce:generatePlate( )
            conce:setVehicleConce( player, { name = vehicle, model = vehicleConfig.model }, { 255, 255, 255 }, vehicleConfig.category )
        end
    end,
    ["hyperscripts:addVehicleVip"] = function (args)
        local playerID = tonumber(args[1]);
        local exportsResource = args[2]
        local vehicle = string.gsub(args[3], "-", " ")
        local validate = tonumber(args[4])
        
        local player = getPlayerID(playerID);
        local conce = exports[exportsResource];

        local vehicleConfig = conce:getVehicleVipConfig(vehicle);

        local verify = conce:getVehicle( account, vehicleName )
        if not verify then
            local plate = conce:generatePlate( )
            conce:setVehicleVip( player, vehicle, vehicleConfig.category, vehicleConfig.model, validate )
        end
    end,
    ["testeItem"] = function (args)
        print(args[1])
    end
}