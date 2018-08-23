require 'dxruby'
require_relative 'janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'

module Game
  class Director
    def initialize
      @janken = ::Janken.new
    end

    def play
      if @janken.end?
        # 終了条件満たしていても、結果は表示
        @janken.showHands
        # どっちかがHPゼロになったらエンディングへ
        if(p1_HP <= 0 || p2_HP <= 0)
          Scene.current = :ending if Input.key_push?(K_SPACE)
        else
          #  play # 終わりじゃなければ、第2回戦、第3回戦...へ。
        end
      else
        @janken.run
      end
    end
  end
end
