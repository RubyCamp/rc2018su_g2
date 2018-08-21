require 'dxruby'
require_relative 'scene'
require_relative 'scenes/title/director'

Window.width = 800
Window.height = 600

Scene.add(:title, Title::Director.new)

Scene.current = :title

Window.loop do
    Scene.play
end