require 'dxruby'
require_relative 'scene'
require_relative 'scenes/title/director'
require_relative 'scenes/charactor_select/director'

Window.width = 800
Window.height = 600

Scene.add(:title, Title::Director.new)
Scene.add(:charactor_select, CharactorSelect::Director.new)
sound = Sound.new('sound/select_charactor.wav')
sound.play

Scene.current = :title

Window.loop do
    Scene.play
end