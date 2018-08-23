require_relative "player_janken"

class Player2_janken < Player #classの名前を持たせる
	def play #継承したメソッド
		Window.draw(350, 100, @gu) if @i == 1
		Window.draw(350, 100, @ti) if @i == 2
		Window.draw(350, 100, @pa) if @i == 3
 	end
end
