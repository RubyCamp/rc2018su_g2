require_relative "player1_janken"
require_relative 'player2_janken'

class Janken
	def initialize
		@p1 = Player1_janken.new('Ruby')
		@p2 = Player2_janken.new('Python')
		@var = 0
		@winner = 0
		@winner_hand = 0
		@cnt = 0
		@end = false
	end

	def run
		# 
		judge
		@p1.play
		@p2.play
		
		# 時間取得
		@t = Time.now
		p @t # 確認用

		# 制限時間取得
      	@limit ||= @t + 5
		p @limit # 確認用

		# 時間制限にかかる終了条件
		if @t > @limit
			@end = true
		end 
	end

	def judge
		@var = @p1.push_key - @p2.push_key
		var = @var
		if @p1.push_key != 0 && @p2.push_key != 0
			@end = true
			if var == -1 || var == 2
				puts "P1の勝ちです"
				@winner = 1
				@winner_hand = @p1.push_key
			elsif var == 1 || var == -2
				puts "P2の勝ちです"
				@winner = 2
				@winner_hand = @p2.push_key
			elsif var == 0
				puts "あいこです"
			end
		end
	end

	def end?
		@end
	end
end
