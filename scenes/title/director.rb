module Title
  class Director
    BACKGROUND = Sprite.new(0, 0, Image.load('images/title/title.jpg'))
    BGM = Sound.new('sound/title/title_bgm.wav')
    def initialize
      BGM.play
    end

     def play
       BACKGROUND.draw

       if Input.key_push?(K_SPACE)
        BGM.stop
        Scene.add(:charactor_select, CharactorSelect::Director.new)
        Scene.current = :charactor_select 
       end
    end 
  end
end
