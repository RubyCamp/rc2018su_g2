module Ending
  class Director
    #BACKGROUND = Image.load('images/background_ending.png')
    #BGM = Sound.new('sound/bgm_ending.wav')

    def play
      #Window.draw(0, 0, BACKGROUND)
      p 'エンディング'
      #Scene.current = :game if Input.key_push?(K_SPACE)
    end
  end
end
