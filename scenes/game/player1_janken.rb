require_relative "player_janken"

class Player1_janken < Player
  def initialize(selectedCharacter = :player1)
		@gu = Image.load('images/game/gu.png')
		@ti = Image.load('images/game/ti.png')
		@pa = Image.load('images/game/pa.png')
		@i = 0
		@chara = selectChara(selectedCharacter) # 入力:選ばれたキャラの文字情報. 代入: Characterクラス.
    @hp = @chara.hp
  end


	def keys #hash
    {
      gu:K_A, #カンマ忘れない
      ti:K_W,
      pa:K_D
    }
  end

end
