require 'gosu'

module Bola
 @flagX=true
 @flagY=true
 
 
 def movimento

   direcao_bola_X
   movimentar_bola_jogo_eixoX
   direcao_bola_Y
   movimentar_bola_jogo_eixoY

end

 def direcao_bola_X
   if ( ($bolinhaX > 0 ) && ($bolinhaX < 980) ) 
      if ($posicaoVertical..($posicaoVertical+52)).any?($bolinhaY..$bolinhaY+10)       
         if ($bolinhaX<= 65) && ($bolinhaX > 63) 
          @flagX=mudar_direcao_bola(!@flagX)   
         end
      elsif ($posicaoVertical_IA..($posicaoVertical_IA+52)).any?($bolinhaY..$bolinhaY+10)       
         if ($bolinhaX<= 928) && ($bolinhaX > 926) 
          @flagX=mudar_direcao_bola(!@flagX)   
         end
      end

   else
      @flagX=mudar_direcao_bola(!@flagX)
      contar_placar
      $bolinhaX=($Tela_pausa.width/2)
      $bolinhaY=($Tela_pausa.height/2)
      $posicaoVertical=($bolinhaY+5)-26
      $posicaoVertical_IA=$posicaoVertical 
      sleep 0.9
   end
 end

 def movimentar_bola_jogo_eixoX
    if @flagX 
     $bolinhaX=$bolinhaX-1
    else 
     $bolinhaX=$bolinhaX+1
    end
 end

 def movimentar_bola_jogo_eixoY
    if @flagY
     $bolinhaY=$bolinhaY-1
    else
     $bolinhaY=$bolinhaY+1
    end
 end

 def mudar_direcao_bola (flag)
  flag
 end

 def desenharBola
   @bola= Gosu::Image.new(self, "img/bolinha.png", true)
   @bola.draw $bolinhaX,$bolinhaY,0
 end

 def direcao_bola_Y
    @flagY=mudar_direcao_bola(!@flagY) if ($bolinhaY+5) >= 600 || ($bolinhaY) <= 0  
 end

 def desenhar_placar
   @placarplayer1= Gosu::Image.new(self,"img/numeros/#{$placar[0]}.png", true)
   @placarplayer1.draw 440,30,0
   @placarplayer2= Gosu::Image.new(self,"img/numeros/#{$placar[1]}.png", true)
   @placarplayer2.draw 500,30,0
 end 
 def contar_placar
   if $placar[0]< 5 && $placar[1]< 5
      if @flagX == true
       $placar[0]=$placar[0]+1
        if $placar[0]==5
         $placar[0]=0
         $placar[1]=0
         @resultado=true
        end
      else
       $placar[1]=$placar[1]+1
       if $placar[1]==5
         $placar[0]=0
         $placar[1]=0
         @resultado=!@resultado
        end
      end      
   end
 def ganhador
   if @flagX == true
      @player1= Gosu::Image.new(self,"img/ganhador.png", true)
      @player1.draw 0, 0, 0
      
   else
      @player1= Gosu::Image.new(self,"img/perdedor.png", true)
      @player1.draw 0, 0, 0
      
   end

 end



 end



end