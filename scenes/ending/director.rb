module Ending
  class Director
    #BACKGROUND = Image.load('images/background_ending.png')
    #BGM = Sound.new('sound/bgm_ending.wav')
    def initialize
      @ending = false
    end

    def play
      #Window.draw(0, 0, BACKGROUND)
      if @ending == false
        @ending = true
        print "エンディング\n"
      end
      #Scene.current = :game if Input.key_push?(K_SPACE)
    end
  end
end
