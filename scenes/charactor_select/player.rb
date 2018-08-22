class Player < Sprite
    def initialize(x, y, image, controller)
        @controller = controller
        super
    end

    def update
        self.x += @controller.x
        self.y += @controller.y
        #self.select_charactor if click?
        self.scale_x = 0.25
        self.scale_y = 0.25
        self.draw
    end

    # キャラクターの選択
    def select_charactor

    end
end