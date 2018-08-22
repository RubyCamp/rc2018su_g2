module Ending
  class Director
    BACKGROUND = Image.load('') #set background
    BGM = Sound.new('') #set BGM

    def initialize
      @player_images = {
         #set character's image
      }
    end

    def play
      Window.draw(0, 0, BACKGROUND)

      if Input.key_push?(K_C) then
        Scene.current = :title #continue
      end

    def change_bgm
      Scene[:title].class::BGM.stop
      BGM.play
    end
  end
end
