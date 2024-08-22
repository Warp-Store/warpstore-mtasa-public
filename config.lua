--[[
╔══════════════════════════════════════════════════[ www.warpstore.app ]═════════════════════════════════════════════════════════════╗

                               ██╗    ██╗ █████╗ ██████╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
                               ██║    ██║██╔══██╗██╔══██╗██╔══██╗     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
                               ██║ █╗ ██║███████║██████╔╝██████╔╝    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
                               ██║███╗██║██╔══██║██╔══██╗██╔═══╝       ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
                               ╚███╔███╔╝██║  ██║██║  ██║██║         ███████║   ██║   ╚██████╔╝██║  ██║███████╗
                                ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝           ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
                                                                                                                                         
                                
╚══════════════════════════════════════════════════[ www.warpstore.app ]═════════════════════════════════════════════════════════════╝                                                                                                         
--]]


config = {
    ['warp:delivery'] = {
        ['token'] = 'SEU TOKEN QUE PEGA NO SITE',
        ['data:id'] = 'ID';
        ['color:hex'] = '#0095ff';
        ['entrega'] = {
            ['balões'] = {
                ['ativar'] = true; -- Caso deseja que a mensagem na tela apareça.
                ['visivel'] = true; -- Caso deseja que todas as pessoas vejam a mensagem na tela.
                ['texto'] = 'O(a) jogador ${hex}${name}(${id}) #FFFFFFAtivou o produto ${hex}${product}#FFFFFF com sucesso!\n${hex}www.warpstore.app';
                ['rgb'] = { 255, 255, 255 };
                ['font'] = 'roboto-bold.ttf';
                ['size'] = 20;
                ['quantidade'] = 50;
                ['tempo'] = 10; -- Tempo que ira ficar na tela do player
                ['formato'] = 1000; -- Formato de tempo ( 1000 = segundos, 60000 =  minutos, 3600000 = Hora )
            };
            ['chatbox'] = {
                ['ativar'] = true;
                ['visivel'] = true;
                ['rgb'] = { 255, 255, 255 };
                ['texto'] = '[WARP-DELIVERY] - O(a) jogador #0095ff${name}(${id}) #FFFFFFAtivou o produto #0095ff${product}#FFFFFF com sucesso!';
            };
            ['infobox'] = {
                ['ativar'] = true;
                ['visivel'] = true;
                ['notificação'] = {
                    function( player, dados )
                        return exports['[HS]Notify_System']:notify( player, 'O(a) jogador '..dados.name..'('..dados.id..') Ativou o produto '..dados.product..' com sucesso', 'info' )
                    end,
                };
            };
        };
        ['tempo:entrega'] = {
            ['tempo'] = 10; -- Tempo que ira ficar na tela do player
            ['formato'] = 1000; -- Formato de tempo ( 1000 = segundos, 60000 =  minutos, 3600000 = Hora )
            ['repetições'] = 0; -- Verificação de quantas vezes ira ficar rodando o sistema, deixe em 0 para sempre verificar.
        };
        ['development'] = { -- Verificação para ficar testando comando deixe em false e ele não ira atualizar no site que foi entregue.
            ['update:status'] = true; -- Não mexer com o servidor aberto pois ira ficar liberando o produto a todo momento sem atualizar no site que já foi entregue.
        };
    };
}


-- Função Util para obter o elemento do player pelo ID:


getPlayerID = function( id )
    for _, player in ipairs( getElementsByType( 'player' ) ) do
         local data_id = getElementData( player, config['warp:delivery']['data:id'] ) or 0
         if tonumber( data_id ) == tonumber( id ) then
              return player
         end
    end
    return false
end