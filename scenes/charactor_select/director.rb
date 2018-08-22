require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'player'
require_relative 'charactor_icon'

module CharactorSelect
	class Director
		attr_accessor :charactors, :players

        # キャクター選択用アイコン
        PLAYER_FINGER_1 = Image.load('images/player_finger_1.png')
        PLAYER_FINGER_2 = Image.load('images/player_finger_2.png')

        # キャクター用アイコン
        RUBY_ICON = Image.load('images/card_ruby.png')
        PYTHON_ICON = Image.load('images/card_python.png')

        def initialize
            @font = Font.new(75)
            @charactors = []
            @charactors << CharactorIcon.new(-100, -150, RUBY_ICON, "ruby")
            @charactors << CharactorIcon.new(300, -150, PYTHON_ICON, "python")
		
            # プレイヤーの生成
            @players = []
            @players << Player.new(0, 400, PLAYER_FINGER_1, Controller1.new)
            @players << Player.new(600, 400, PLAYER_FINGER_2, Controller2.new)


        end

        def play
            Window.draw_font(125, 20, "キャラクター選択", @font)
            Sprite.update(@charactors)
            Sprite.update(@players)
        end
    end
end