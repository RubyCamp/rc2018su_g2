module CharactorSelect
    class CharactorIcon < Sprite
        def initialize(x, y, img, name)
            @img = img
            @name = name
            super
        end

        def update
            self.scale_x = 0.25
            self.scale_y = 0.25
            self.draw
        end
    end
end