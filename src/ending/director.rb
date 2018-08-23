

module Ending
  class Director
    BACKGROUND = Image.load('mountain2.jpg') #set background
    BGM = Sound.new('') #set BGM

    def initialize
      @player_images = {
         'player1' => Image.load(''),
         'player2' => Image.load('')
      }
    end

    def play
      Window.draw(0, 0, BACKGROUND)

      #drawing winner's illust
      #winner = ...
      #img = @player_images[winner]
      if Input.key_push?(K_C) then
        Scene.current = :title #continue
      end

    def change_bgm
      Scene[:title].class::BGM.stop
      BGM.play
    end
  end
end
