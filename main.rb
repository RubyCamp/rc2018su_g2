require 'dxruby'
require_relative 'scene'
require_relative 'scenes/title/director'
require_relative 'scenes/charactor_select/director'
require_relative 'scenes/game/director'
require_relative 'scenes/ending/director'

Window.width = 800
Window.height = 600

#Scene.add(:title, Title::Director.new)
Scene.add(:charactor_select, CharactorSelect::Director.new)
Scene.add(:game, Game::Director.new)
#Scene.add(:ending, Ending::Director.new)

Scene.current = :charactor_select

#Scene[:title].class::BGM.loop_count = -1 # 無限ループ
#Scene[:title].class::BGM.play

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end