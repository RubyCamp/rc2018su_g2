require_relative "player1_janken"
require_relative 'player2_janken'

class Janken　# 1回ごとのじゃんけんの対戦を扱うクラス
	def initialize # ここで、キャラ選択画面シーンから、選択したキャラの情報が入力される
		@p1 = Player1_janken.new('Ruby') # ここでは、P1がRuby選択されたと仮定
		@p2 = Player2_janken.new('Python') # ここでは、P2がPython選択されたと仮定
		@var = 0
		@winner = 0
		@winner_hand = 0
		@cnt = 0
		@end = false
	end

	def run
		# 時間取得
		@t = Time.now
		p @t # 確認用

		# 制限時間取得
      	@limit ||= @t + 5
		p @limit # 確認用

		# 残り時間を表示（Windowに）
		#if @limit-@t >= 0
		#	p (@limit-@t)
		#end
		
		# 勝利判定
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
				@winner = 1
				@winner_hand = @p1.push_key
			elsif @p1.push_key == 0 && @p2.push_key != 0
				@winner = 2
				@winner_hand = @p2.push_key
			elsif @p1.push_key == 0 && @p2.push_key == 0
				@winner = 0
				@winner_hand = 0
				## ここにあいこメソッドが来る？（連打処理） ##
			end
		end
	end

	def end?
		@end
	end
end
