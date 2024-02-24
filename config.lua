config = {
    token = 'your-token', -- Você pegar seu token em: https://docs.warpstore.app
    chat = {
        global = false, -- (true) para todos os jogadores ver, ou (false) para somente o jogador!
        color = '#ffffff', -- (#) Cor da mensagem que será enviada no chat!
    },
    commands = {
        showSales = "compras" -- O comando usado para ver as compras e data de expiração.
    },
    panelHtml = {
        enabled = true, -- Caso estiver ativo ele exibe um painel na tela para todos os jogadores avisando que o usuário comprou o produto,
        title = "Warp Delivery",
        global = true, -- Caso qusier que todos os jogadores vejam esta mensagem deixe ativado, e false para quando quiser que apenas o comprador veja
        message = ":name fez uma doação do produto :product para o servidor."
    },
    messages = {
        newBuy = "[WARP - DELIVERY] :name comprou :product com sucesso!",
        notFound = "[WARP - DELIVERY] Não foi encontrado nenhum benefício!",
        expireIn = "[WARP - DELIVERY] O produto :name e o :item expira em :date",
        expired = "[WARP - DELIVERY] :name, O seu produto :product teve um item expirado.",
        expire = "[WARP - DELIVERY] O produto :name expirou e o :item foi removido!", -- item representa caso seja um grupo, quantidade, ou qualquer outro argumento. Não remova
        noHaveExpire = "[WARP - DELIVERY] Você não tem nenhum produto para expirar", -- item representa caso seja um grupo, quantidade, ou qualquer outro argumento. Não remova
        useInfoBox = false, -- Caso ele seja false as mensagens serão exibidas no chat, e caso seja true será exibida na sua info-box
    },
    debug = {
        enabled = true, -- Deixe em true para caso de erros na request do servidor ele retornar um erro!
    },
    cooldownRequest = 20000, -- Tempo em milisegundos que o site verifica se tem alguma compra para ativar no jogo.
    cooldownRunCommand = 2500, -- Tempo de rodar os comandos de entrega depois de pagos!
    cooldownExpire = 60000, -- Tempo de verificação para expirar o grupo do usuário!

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