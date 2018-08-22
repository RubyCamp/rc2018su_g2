require_relative "player_janken"


class Player1_janken < Player
	def keys #hash
    {
      gu:K_A, #カンマ忘れない
      ti:K_W,
      pa:K_D
    }
  end

end
