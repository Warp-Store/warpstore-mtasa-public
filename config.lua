config = {
    token = 'mtasa-21d22e9c-e1a5-4675-bae7-6e19215898a6-abe3111e-4db1-45b9-99b5-9d774dbddd63', -- Você pegar seu token em: https://docs.warpstore.app
    chat = {
        global = false, -- (true) para todos os jogadores ver, ou (false) para somente o jogador!
        color = '#ffffff', -- (#) Cor da mensagem que será enviada no chat!
    },
    commands = {
        showSales = "vertempo" -- O comando usado para ver as compras e data de expiração.
    },
    messages = {
        newBuy = "[WARP - DELIVERY] :name comprou :product com sucesso!",
        notFound = "[WARP - DELIVERY] Não foi encontrado nenhum benefício!",
        expireIn = "[WARP - DELIVERY] O produto :name e o :item expira em :date",
        expire = "[WARP - DELIVERY] O produto :name expirou e o :item foi removido!", -- item representa caso seja um grupo, quantidade, ou qualquer outro argumento. Não remova
        noHaveExpire = "[WARP - DELIVERY] Você não tem nenhum produto para expirar", -- item representa caso seja um grupo, quantidade, ou qualquer outro argumento. Não remova
        useInfoBox = false, -- Caso ele seja false as mensagens serão exibidas no chat, e caso seja true será exibida na sua info-box
    },
    debug = {
        enabled = true, -- Deixe em true para caso de erros na request do servidor ele retornar um erro!
    },
    cooldownRequest = 30000, -- Tempo em milisegundos que o site verifica se tem alguma compra para ativar no jogo.
    cooldownRunCommand = 2500, -- Tempo de rodar os comandos de entrega depois de pagos!
    cooldownExpire = 1000, -- Tempo de verificação para expirar o grupo do usuário!
    webhook = "webhook-url", -- Link da webhook do discord, caso você não tenha o acesso ao plano que permite o bot, você pode usar a webhook!,

    findUserById = function(id)
        v = false
        for i, player in ipairs (getElementsByType("player")) do
            if getElementData(player, "ID") == id then
                v = player
                break
            end
        end
        return v
    end,
    
    InfoBox = {
        displaySeconds = 3000, -- Tempo de notificação, caso não for usar info-box não mecha.

        -- Aqui fica sua função de info-box que será chamada quando nescessário pelo nosso plugin!
        execute = function (element, text, type)
            exports.ic_infobox:addNotification(element, text, type, element, config.InfoBox.displaySeconds, 255,255,255,true)
        end,

        -- Define aqui os status de sua infobox, não mecha no primeiro valor, apenas no segundo.
        status = {
            ["success"] = "success",
            ["info"] = "info",
            ["warning"] = "warning",
            ["error"] = "error"
        } 
    }
}