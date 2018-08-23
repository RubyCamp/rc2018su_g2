class HitPoint
    attr_accessor 
    def initialize(x, y, hp, direction)
        @direction = direction
        @green_bar = Sprite.new(x, y, Image.new(100, 10, C_GREEN))
        if direction == 'right'
            @red_bar = Sprite.new(x + 100, y, Image.new(1, 10, C_RED))
        else
            @red_bar = Sprite.new(x, y, Image.new(1, 10, C_RED))
        end

        @max_hp = hp
        @next_hp = hp

        @next_bar_len = 100
        @curr_bar_len = 100
        #super(x, y, @bar)
    end

    def damage(damage)
        @next_hp -= damage
        @next_hp = 0 if @next_hp < 0

        @next_bar_len = ((@next_hp / @max_hp) * 100).to_i

        @green_bar.image.x = next_bar_len

        @red_bar.image.x = @curr_bar_len - @next_bar_len

        @curr_bar_len = @next_bar_len

        if @direction == 'right'
            @red_bar.x -= @curr_bar_len - @next_bar_len
        elsif @direction == 'left'
            @green_bar.x -= @curr_bar_len - @next_bar_len
        end
    end

    def play
        if 1 < @red_bar.image.x
            @red_bar.image.x -= 1
            if @direction == 'left'
                @red_bar.x += 1
            end
        end
        @green_bar.draw
        @red_bar.draw
    end
end