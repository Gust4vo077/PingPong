require 'gosu'

module Pausa


    class JogoPausa < Gosu::Window
          def initialize
            super(1000, 600, false)
            self.caption="pausa"
            @botao =1
          end
        
          def update
 
          end
        
          def draw
            planodefundo("doe")
            desenharbotaoPausa(@botao)

          end
         
          def button_down(id)
            if id == Gosu::KbUp
             if @botao > 1
              @botao =@botao -1
             end
            elsif id == Gosu::KbDown
             if @botao < 3
              @botao =@botao +1
             end
            elsif id == Gosu::KB_SPACE
              acao_telaPausa(@botao)
              close
            end
    
          end 

          
    end
end