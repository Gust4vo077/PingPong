
require 'gosu'



module Acao 
    def planodefundo(nome)
      @imagem = Gosu::Image.new(self, "img/#{nome}.png", true)
      escala_x = self.width.to_f / @imagem.width
      escala_y = self.height.to_f / @imagem.height
      @imagem.draw 0, 0, 0, escala_x, escala_y

    end
    
    def desenharBarra
      @barra = Gosu::Image.new(self, "img/barra.PNG", true)
      @barra.draw 35,$posicaoVertical,0
      
    end
    def desenharBarra_IA
      @barra = Gosu::Image.new(self, "img/barra.PNG", true)
      @barra.draw 935,$posicaoVertical_IA,0
      
    end
  
    def acao_barra_jogo
      if button_down?(Gosu::KbDown)    &&   $estado_Ping_Pong == "start"
       if $posicaoVertical<546
        $posicaoVertical=$posicaoVertical+2
       end
      elsif button_down?(Gosu::KbUp) &&  $estado_Ping_Pong == "start"
       if $posicaoVertical>0
        $posicaoVertical=$posicaoVertical-2
       end
      end
    end

    def acao_barra_jogo_IA
      $posicaoVertical_IA=($bolinhaY+5)-26 if ($bolinhaY - $posicaoVertical_IA)> 0  && ( ($posicaoVertical_IA+52)- $bolinhaY) > 0 && ($bolinhaY>21 && $bolinhaY<572)    
    end
    
    def acao_telaPausa(id)
        case id
         when 1
          $estado_Ping_Pong="start"
          close
         when 2
          $estado_Ping_Pong="menu"
          $placar[0]=0
          $placar[1]=0
          $bolinhaX=($Tela_pausa.width/2)-5
          $bolinhaY=($Tela_pausa.height/2)-5
          $posicaoVertical=($bolinhaY+5)-26
          $posicaoVertical_IA=$posicaoVertical
          close
         when 3
          $estado_Ping_Pong="finalizar"
          close 
        end
    end
    def desenharbotaoPausa(id)
      array=[200,290,380]
      
      @botaopausa = Gosu::Image.new(self, "img/botao/continu.png", true)
      @botaopausa.draw  400,array[0],0
      @botaopausa1= Gosu::Image.new(self, "img/botao/principal.png", true)
      @botaopausa1.draw 400,array[1],0
      @botaopausa2= Gosu::Image.new(self, "img/botao/exit.png", true)
      @botaopausa2.draw 400,array[2],0
      selecionarbotao( array[id-1])
    end
    def selecionarbotao(idY)
      @aux = Gosu::Image.new(self, "img/botao/button-select.png", true)
      @aux.draw 400,idY,0
    end
end