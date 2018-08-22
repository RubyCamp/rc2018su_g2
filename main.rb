require 'dxruby'
require_relative 'scene'
require_relative 'scenes/title/director'
<<<<<<< HEAD
require_relative 'scenes/game/director'
require_relative 'scenes/ending/director'
=======
require_relative 'scenes/charactor_select/director'
>>>>>>> 7abcb744ba8470f2701207a9fcc589634674ac8d

Window.width = 800
Window.height = 600

Scene.add(:title, Title::Director.new)
<<<<<<< HEAD
#Scene.add(:game, Game::Director.new)
#Scene.add(:ending, Ending::Director.new)

Scene.current = :title

#Scene[:title].class::BGM.loop_count = -1 # 無限ループ
#Scene[:title].class::BGM.play

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
=======
Scene.add(:charactor_select, CharactorSelect::Director.new)

Scene.current = :title

Window.loop do
    Scene.play
>>>>>>> 7abcb744ba8470f2701207a9fcc589634674ac8d
end