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
    end
}