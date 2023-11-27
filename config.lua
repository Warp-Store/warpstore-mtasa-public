config = {
    token = 'mtasa-71f1daba-9bf0-4bb8-ae06-9c29cc392541-1531edcb-c25e-4a59-9e42-d54ae5dd979a', -- Você pegar seu token em: https://docs.warpstore.app
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
        useInfoBox = true, -- Caso ele seja false as mensagens serão exibidas no chat, e caso seja true será exibida na sua info-box
    },
    debug = {
        enabled = true, -- Deixe em true para caso de erros na request do servidor ele retornar um erro!
    },
    cooldownRequest = 30000, -- Tempo em milisegundos que o site verifica se tem alguma compra para ativar no jogo.
    cooldownRunCommand = 2500, -- Tempo de rodar os comandos de entrega depois de pagos!
    cooldownExpire = 1000, -- Tempo de verificação para expirar o grupo do usuário!
    webhook = "webhook-url", -- Link da webhook do discord, caso você não tenha o acesso ao plano que permite o bot, você pode usar a webhook!,
    
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