require_relative "player1_janken"
require_relative 'player2_janken'

<<<<<<< HEAD
class Janken #1回ごとのじゃんけんの対戦を扱うクラス
=======
class Janken # 1回ごとのじゃんけんの対戦を扱うクラス
>>>>>>> 68480a1755bbb3fe0632e8515feec8e804607a7a
	def initialize # ここで、キャラ選択画面シーンから、選択したキャラの情報が入力される
		@p1 = Player1_janken.new(Scene.players(:player1))
		@p2 = Player2_janken.new(Scene.players(:player2))
		@var = 0
		@winner = 0
		@loser = 0
		@winner_hand = 0
		@cnt = 0
		@p1_cnt = 0
		@p2_cnt = 0
		@end = false
	end

	def run
		p @p1.hp
		# 時間取得
		@t = Time.now
		#p @t # 確認用

		# 制限時間取得
      	@limit ||= @t + 5
		#p @limit # 確認用

		# 残り時間を表示（Windowに）
		#if @limit-@t >= 0
		#	p (@limit-@t)
		#end

		# じゃんけん勝利判定
		judge
		# 表示
		#showHands
		if @p1.push_key != 0 && @p2.push_key == 0
			showHands
		end

		timeLimit
	end

	def showHands # 出す手のみを表示するメソッド（キャラは別で定義したほうがよい?）
		@p1.play
		@p2.play
	end

	def judge
		# 両者、手を出した時の終了条件
		@var = @p1.push_key - @p2.push_key
		var = @var
		if @p1.push_key != 0 && @p2.push_key != 0
			@end = true # 1回あたりのじゃんけん終了条件はクリア
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

	def timeLimit
		# 時間制限にかかる終了条件
		if @t > @limit
			@end = true #1回あたりの終了条件は満たしている
			if @p1.push_key != 0 && @p2.push_key == 0
				puts "P1の勝ちです"
				@winner = 1
				@loser = 2
				@winner_hand = @p1.push_key
				currentHP(@winner, @loser, @winner_hand)
			elsif @p1.push_key == 0 && @p2.push_key != 0
				puts "P2の勝ちです"
				@winner = 2
				@loser = 1
				@winner_hand = @p2.push_key
				currentHP(@winner, @loser, @winner_hand)
			elsif @p1.push_key == 0 && @p2.push_key == 0
				puts "あいこです"
				p @t
				p @limit
				draw

				if @p1_cnt > @p2_cnt
					puts "P1の勝ちです"
					@winner = 1
					@loser = 2
					@winner_hand = @p1.push_key
					currentHP(@winner, @loser, @winner_hand)
				elsif @p1_cnt < @p2_cnt
					puts "P2の勝ちです"
					@winner = 2
					@loser = 1
					@winner_hand = @p2.push_key
					currentHP(@winner, @loser, @winner_hand)
				end
			end
		end
	end

	#ダメージ処理
	"""
	def currentHP(winner, loser, winner_hand)
		ATK = atk[winner] * mag[winner_hand]
		loserHP = hp[loser]
		loserHP = hp[loser] - ATK
		return loserHP
	end

	def showHP
		p loserhp = hp[loser]
	end
	"""

	def draw
		while @t > @limit do
			@p1_cnt += 1 if Input.key_push?(K_S)
			@p2_cnt += 1 if Input.key_push?(K_DOWN)
		end
	end

	def end?
		@end
	end


	def calcDamage
		
	end

end
