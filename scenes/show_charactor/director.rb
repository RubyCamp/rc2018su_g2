module ShowCharactor
    class Director
        def initialize
            @font = Font.new(75, font_name="ＭＳ ゴシック")
            
            @player1 = Sprite.new(-100 - 500, -50, Image.load("images/select/card_#{Scene.players(:player1).downcase}.png"))
            @player1.scale_x = 0.5
            @player1.scale_y = 0.5
            @player2 = Sprite.new(300 + 500, -50, Image.load("images/select/card_#{Scene.players(:player2).downcase}.png"))
            @player2.scale_x = 0.5
            @player2.scale_y = 0.5
            
            @sound = Sound.new('sound/show_charactor/gong.wav')
            @cnt = 0
        end

        def play
            Window.draw_font(225, 20, "ゲーム開始", @font)
            Window.draw_font(355, 300, "VS", @font)
            @player1.x += 10 if @player1.x <= -100
            @player2.x -= 10 if 300 <= @player2.x
            @player1.draw
            @player2.draw

            @cnt += 1
            @sound.play if @cnt == 40
            if @cnt == 360
                Scene.current = :game
                Scene.add(:game, Game::Director.new)
            end
        end
    end
end