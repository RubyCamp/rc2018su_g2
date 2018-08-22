module Title
  class Director
    BACKGROUND = Image.load('images/ruby.png')
    #BGM = Sound.new('sound/bgm.wav')

    def play
      Window.draw(0, 0, BACKGROUND)
      p "タイトル"
      Scene.current = :game if Input.key_push?(K_SPACE)
    end
  end
end
