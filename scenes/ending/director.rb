#require 'dxruby'
#require_relative '../../scene'
#require_relative '../scenes/title/director'
#require_relative '../scenes/charactor_select/director'
#require_relative '../scenes/game/director'
#require_relative '../scenes/ending/director'

module Ending
  class Director
    BACKGROUND = Image.load('images/ending/mountain2_re.jpg')
    BGM = Sound.new('sound/ending/winner_bgm.wav')

    def initialize
      #@player_images = {
      #   'player1' => Image.load(''),
      #   'player2' => Image.load('')
      #}
      @cnt = false
      BGM.play
    end

    def play
      if @cnt == false
        @cnt = true
        p "エンディング"
      end

      Window.draw(0, 0, BACKGROUND)

      #drawing winner's illust
      #winner = ...
      #img = @player_images[winner]
      if Input.key_push?(K_C) then
        #Cを押すとタイトル画面に遷移
        #その際に初期化（新たにシーンを作成）
        BGM.stop
        Scene.update_player(:player1, nil)
        Scene.update_player(:player2, nil)
        Scene.add(:title, Title::Director.new)
        #Scene.add(:charactor_select, CharactorSelect::Director.new)
        #Scene.add(:game, Game::Director.new)
        #Scene.add(:ending, Ending::Director.new)
        Scene.current = :title
      end
    end

    #def change_bgm
      #Scene[:title].class::BGM.stop
      #BGM.play
    #end
  end
end
