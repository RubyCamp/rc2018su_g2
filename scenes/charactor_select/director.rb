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

        # キャクターカード用アイコン
        RUBY_ICON = Image.load('images/card_ruby.png')
        PYTHON_ICON = Image.load('images/card_python.png')

        def initialize
            #フォントの生成
            @title_font = Font.new(75)
            @next_font = Font.new(40)

            #キャラクターカードの生成
            @@cards = []
            @@cards << CharactorSelect::CharactorIcon.new(-100, -150, RUBY_ICON, "ruby")
            @@cards << CharactorSelect::CharactorIcon.new(300, -150, PYTHON_ICON, "python")
		
            # プレイヤーの生成
            @players = []
            @players << Player.new(0, 400, PLAYER_FINGER_1, CharactorSelect::Controller1.new, :player1)
            @players << Player.new(600, 400, PLAYER_FINGER_2, CharactorSelect::Controller2.new, :player2)

            @flashing_flag = true
            @flashing_cnt = 0
        end

        def self.cards
            @@cards
        end

        def play
            Window.draw_font(125, 20, "キャラクター選択", @title_font)
            
            #0.5秒おきに"push space to start"を点滅させる
            @flashing_cnt = ((@flashing_cnt + 1) % 30)
            @flashing_flag = !(@flashing_flag) if @flashing_cnt == 0
            Window.draw_font(200, 500, "push space key to start", @next_font) if @flashing_flag && Scene.players(:player1) != nil && Scene.players(:player2) != nil

            Sprite.update(@@cards)
            Sprite.update(@players)
            
            #スペースキーでゲーム開始
            Scene.current = :game if Scene.players(:player1) != nil && Scene.players(:player2) != nil && Input.key_push?(K_SPACE)
        end
    end
end