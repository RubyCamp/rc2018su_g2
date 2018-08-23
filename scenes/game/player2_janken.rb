require_relative "player_janken"

class Player2_janken < Player #classの名前を持たせる
	def initialize(selectedCharacter = :player1)
		@gu = Image.load('images/game/gu.png')
		@ti = Image.load('images/game/ti.png')
		@pa = Image.load('images/game/pa.png')
		@i = 0
		@chara = selectChara(selectedCharacter) # 入力:選ばれたキャラの文字情報. 代入: Characterクラス.
		@hp = @chara
  end

	def play #継承したメソッド
		Window.draw(350, 100, @gu) if @i == 1
		Window.draw(350, 100, @ti) if @i == 2
		Window.draw(350, 100, @pa) if @i == 3
 	end
end
