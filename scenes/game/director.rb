require_relative 'player'
require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'bullet'

module Game
  class Director
    attr_accessor :players, :player_hash

    BACKGROUND = Image.load('images/background_game.png')
    P1_IMAGE = Image.load('images/player1.png')
    P2_IMAGE = Image.load('images/player2.png')
    BULLET1_IMAGE = Image.load('images/bullet1.png')
    BULLET2_IMAGE = Image.load('images/bullet2.png')

    def initialize
      @font = Font.new(24)
      @players = []
      @players << Player.new(10, 100, P1_IMAGE, 1, BULLET1_IMAGE, Controller1.new, 'neko1')
      @players << Player.new(720, 400, P2_IMAGE, -1, BULLET2_IMAGE, Controller2.new, 'neko2')

      @player_hash = {}
      @players.each do |player|
        @player_hash[player.name] = player
      end
    end

    def play
      Window.draw(0, 0, BACKGROUND)
      Sprite.update(@players)
      Sprite.clean(@players)
      bullets = []
      @players.each do |player|
        bullets += player.bullets
      end
      Sprite.check(bullets, @players)
      Window.draw_font(100, 10, @players.map{|player| player.score}.inspect, @font)
    end
  end
end
