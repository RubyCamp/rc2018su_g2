require 'dxruby'
require_relative 'Janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'

p1 = Player1_janken.new
p2 = Player2_janken.new
result = Janken.new

Window.loop do #loop do-end 単位をブロックと呼ぶ
	p1.play
	p p1.push_key
	p2.play
	p p2.push_key
	result.judge
end
