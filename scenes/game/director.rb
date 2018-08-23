require 'dxruby'
require_relative 'Janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'

module Game
  class Director
    def initialize
      @a = "aaa"
      p @a
      
      @janken = Janken.new
      @ending = false
    end

    def play
      if @janken.end?
        # 終了条件満たしていても、結果は表示
        @janken.showHands
        # どっちかがHPゼロになったらエンディングへ
        @ending = true # ここでは、1回の勝負でエンディングに直行
        if @ending == true
          Scene.current = :ending if Input.key_push?(K_SPACE)
        #else
        #  play # 終わりじゃなければ、第2回戦、第3回戦...へ。
        end

      else
        @janken.run
      end
    end
  end
end

