require 'gosu'


  class MenuInicial < Gosu::Window
    def initialize
      super(1000, 600, false)
      self.caption = "menu"
      @estado_menu = "executando"
    end
    
    def update
      close if $estado_Ping_Pong == "start"
    end
  
    def draw
      planodefundo("planodefundo")
    end
  
    def button_down(id)
      if id == Gosu::KB_SPACE 
        $estado_Ping_Pong="start"
      elsif id == Gosu::KB_ESCAPE
        close 
      end
    end

 
  end
