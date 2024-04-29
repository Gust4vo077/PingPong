require 'gosu'

module Start 
  class JogoStart < Gosu::Window
      def initialize
        super(1000, 600, false)
        self.caption="start"
        @resultado=false
      end
    
      def update
        acao_barra_jogo
        acao_barra_jogo_IA

        close if $estado_Ping_Pong=="menu" 
        close if $estado_Ping_Pong=="pausado" 
  
        
      end
    
      def draw
         planodefundo("red_background_1000x600")
         if @resultado==true
          ganhador
         elsif $estado_Ping_Pong =="start"
          desenhar_placar
          desenharBarra
          desenharBarra_IA
          movimento
          desenharBola
         end
      end
      
      def button_down(id)
        if id == Gosu::KB_ESCAPE
          $estado_Ping_Pong="pausado"
        elsif id == Gosu::KB_SPACE 
          if @resultado==true 
            $estado_Ping_Pong="menu" 
            @resultado=!@resultado
          end
        end

      end 
  end

end