require_relative 'controller'
require_relative 'controller1'
require_relative 'controller2'
require_relative 'player'
require_relative 'charactor_icon'

module CharactorSelect
	class Director
		attr_accessor :charactors, :players

        # キャクター選択用アイコン
        PLAYER_FINGER_1 = Image.load('images/select/player_finger_1.png')
        PLAYER_FINGER_2 = Image.load('images/select/player_finger_2.png')

        # キャクターカード用アイコン
        RUBY_ICON = Image.load('images/select/card_ruby.png')
        PYTHON_ICON = Image.load('images/select/card_python.png')
        PERL_ICON = Image.load('images/select/card_perl.png')

        def initialize
            #フォントの生成
            @title_font = Font.new(75, font_name="ＭＳ ゴシック")
            @next_font = Font.new(40, font_name="ＭＳ ゴシック")
            @selected_font = Font.new(50, font_name="ＭＳ ゴシック")
            @selected_font_y = 1200

            #キャラクターカードの生成
            @@cards = []
            @@cards << CharactorSelect::CharactorIcon.new(500, -150, RUBY_ICON, "Ruby")
            @@cards << CharactorSelect::CharactorIcon.new(500, -150, PYTHON_ICON, "Python")
            @@cards << CharactorSelect::CharactorIcon.new(500, -150, PERL_ICON, "Perl")
		
            # プレイヤーの生成
            @players = []
            @players << Player.new(0, 400, PLAYER_FINGER_1, CharactorSelect::Controller1.new, :player1)
            @players << Player.new(600, 400, PLAYER_FINGER_2, CharactorSelect::Controller2.new, :player2)

            @font_alpha = -1
            @alpha_flag = true

            @sound = Sound.new('sound/select/to_game.wav')
            @bgm = Sound.new('sound/select/select_bgm.wav')
            @bgm.loop_count = 100
            @bgm.play
        end

        def self.cards
            @@cards
        end

        def play
            Window.draw_font(95, 20, "キャラクター選択", @title_font)

            @@cards[0].x -= 5 if -100 <= @@cards[0].x
            @@cards[1].x -= 5 if 100 <= @@cards[1].x
            @@cards[2].x -= 5 if 300 <= @@cards[2].x
            
            #両プレイヤーがキャラクター選択時、"push space to start"を点滅させる
            if @alpha_flag
                @font_alpha = @font_alpha + 8
                @alpha_flag = false if @font_alpha == 255
            else
                @font_alpha = @font_alpha - 8
                if @font_alpha == -1
                    @alpha_flag = true
                    @font_alpha += 1
                end
            end
            Window.draw_font(165, 525, "PUSH SPACE KEY TO START", @next_font, option={:alpha => @font_alpha}) if Scene.players(:player1) != nil && Scene.players(:player2) != nil
            @font_alpha -= 1 if @font_alpha == 0

            player1 = Scene.players(:player1).to_s.center(6)
            player2 = Scene.players(:player2).to_s.center(6)
            list = "<%s>P1 VS P2<%s>" % [player1, player2]
            @selected_font_y -= 5 if 450 < @selected_font_y
            Window.draw_font(95, @selected_font_y, list, @selected_font)

            Sprite.update(@@cards)
            Sprite.update(@players) if @selected_font_y == 450
            
            #スペースキーでゲーム開始
            if Scene.players(:player1) != nil && Scene.players(:player2) != nil && Input.key_push?(K_SPACE)
                @sound.play
                @bgm.stop
                Scene.current = :game
            end
        end
    end
end