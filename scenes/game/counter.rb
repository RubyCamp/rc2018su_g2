class Counter
    def initialize(x, y, size)
        @x = x
        @y = y
        @font = Font.new(size, font_name="ＭＳ ゴシック")
        @limit = 10
        @cnt = 0
    end

    def showCnt
        @cnt = (@cnt + 1) % 60
        @limit -= 1 if @cnt == 0 && 0 < @limit
        Window.draw_font(@x, @y, @limit.to_s.rjust(2), @font)
    end

    def resetCnt
        @limit = 10
        @cnt = 0
    end
end