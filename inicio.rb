require 'gosu'
require_relative 'bin/acao.rb'
require_relative 'bin/menu.rb'
require_relative 'bin/pausa.rb'
require_relative 'bin/start.rb'
require_relative 'bin/acao.rb'
require_relative 'bin/bola.rb'
include Pausa
include Start
include Acao
include Bola

$estado="Menu"
class Inicio 

    $Tela_menu = MenuInicial.new
    $Tela_pausa = JogoPausa.new
    $Tela_jogo = JogoStart.new
    $estado_Ping_Pong="menu"
    $bolinhaX=($Tela_jogo.width/2)-5
    $bolinhaY=($Tela_jogo.height/2)-5
    $posicaoVertical=($bolinhaY+5)-26
    $posicaoVertical_IA=$posicaoVertical
    $placar=[0,0]
    


    def inicialicao
     while true   
      case $estado_Ping_Pong
      when "menu"  
       $Tela_menu.show 
      when "start"
       $Tela_jogo.show 
      when "pausado"
       $Tela_pausa.show
      when "finalizar"
       close
      end

     end
    end

end

Inicio.new.inicialicao