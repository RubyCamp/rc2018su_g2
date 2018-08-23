class Counter
    def initialize
        @font = Font.new(75, font_name="ＭＳ ゴシック")
        @limit = 10
        @cnt = 0
    end

    def showCnt
        @cnt = (@cnt + 1) % 60
        @limit -= 1 if @cnt == 0 && 0 <= @limit
        Window.draw_font(300, 20, @limit.to_s, @font)
    end

    def resetCnt
        @limit = 10
        @cnt = 0
    end
end