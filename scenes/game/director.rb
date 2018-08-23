require 'dxruby'
require_relative 'Janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'
require_relative 'character/character'
require_relative 'character/perl'
require_relative 'character/ruby'
require_relative 'character/python'

module Game
  class Director
    def initialize
      @janken = Janken.new
      @ending = false
      @cnt = 0
    end

    def play
      if @janken.end?
        # 終了条件満たしていても、結果は表示
        @janken.showHands
        
        # どっちかがHPゼロになったらエンディングへ
        if @janken.p1.hp <= 0 || @janken.p2.hp <= 0
          @ending = true
          Scene.current = :ending if Input.key_push?(K_SPACE)
        #else
        #  play # 終わりじゃなければ、第2回戦、第3回戦...へ。
        else
          @janken.end = false # エンディングじゃなければ、もう1回戦。
          @janken.reset # エンディングじゃなければ、もう1回戦。
        end

      else
        @janken.run
      end
    end
  end
end

