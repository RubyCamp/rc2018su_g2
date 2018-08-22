module CharactorSelect
    class Player < Sprite
        @@sound = Sound.new('sound/select_charactor.wav')

        def initialize(x, y, image, controller, name)
            @controller = controller
            @name = name.to_sym
            super
        end

        def update
            self.x += @controller.x
            self.y += @controller.y
            self.scale_x = 0.25
            self.scale_y = 0.25
            # self.angle = 360 - 45
            self.draw
            select_charactor if @controller.push_select_key?
        end

        private

        # キャラクターの選択
        def select_charactor
            CharactorSelect::Director.cards.each do |card|
                if self === card
                    @@sound.play
                    Scene.update_player(@name, card.name)
                    break
                end
            end
        end
    end
end