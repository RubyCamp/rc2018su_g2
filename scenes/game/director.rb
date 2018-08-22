require 'dxruby'
require_relative 'Janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'

module Game
  class Director
    def initialize
      @janken = Janken.new
      @ending = false
    end

    def play
      if @janken.end?
        # 

        # どっちかがHPゼロになったらエンディングへ
        @ending = true # ここでは、エンディングに直行
        p 'エンディングへ'
        if @ending == true
          Scene.current = :ending if Input.key_push?(K_SPACE)
        end
      else
        @janken.run
      end
    end
  end
end

