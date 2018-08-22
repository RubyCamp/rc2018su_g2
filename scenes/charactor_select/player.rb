module CharactorSelect
    class Player < Sprite
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
            self.draw
            select_charactor if @controller.push_select_key?
        end

        # キャラクターの選択
        def select_charactor

        end
    end
end