require_relative 'player'


module Game
  class Director
    attr_accessor :players, :player_hash

    def initialize
    end

    def play
      Window.draw(0, 0, BACKGROUND)
      #Sprite.update(@players)
      #Window.draw_font(100, 10, @players.map{|player| player.score}.inspect, @font)
    end
  end
end
