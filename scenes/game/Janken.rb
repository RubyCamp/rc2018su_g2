require_relative "player1_janken"
require_relative 'player2_janken'

class Janken # 1回ごとのじゃんけんの対戦を扱うクラス
	attr_reader :p1, :p2, :winner
	attr_accessor :end
	def initialize # ここで、キャラ選択画面シーンから、選択したキャラの情報が入力される
		@p1 = Player1_janken.new(Scene.players(:player1)) # ここでは、P1がRuby選択されたと仮定
		#p @p1.select
		#p @p1.chara.hp

		@p2 = Player2_janken.new(Scene.players(:player2)) # ここでは、P2がPython選択されたと仮定
		#p @p2.select
		p "P1's HP:"
		p @p1.hp
		p "p1 atk: "
		p @p1.atk
		#p "P1 maxHP:",@p1.hp
		p "P2's HP:" 
		p @p2.hp
		p "p2 atk: "
		p @p2.atk
		#p "P2 maxHP:",@p2.hp 
		@p1_HP = 0
		@p2_HP = 0
		@var = 0
		@winner = 0
		@winner_hand = 0
		@cnt = 0
		@end = false
		@timer = 0
	end

	def run
		@timer += 1
		# 時間取得
		#@t = Time.now
		#p @t # 確認用

		# 制限時間取得
      	#@limit ||= @t + 5
		#p @limit # 確認用

		# 残り時間を表示（Windowに）
		#if @limit-@t >= 0
		#	p (@limit-@t)
		#end
		
		# 勝利判定
		judge
		# 表示
		showChara
		#showHands
		if @p1.push_key != 0 && @p2.push_key != 0
			showHands
			showChara
		end
		
		timeLimit
	end

	def reset
		p "------------------->8-------------------"
		#p @p1.hp
		@p1_HP = @p1.hp
		@p2_HP = @p2.hp
		#p Scene.players(:player1)
		@p1 = Player1_janken.new(Scene.players(:player1))
		@p2 = Player2_janken.new(Scene.players(:player2))
		#p @p1
		@p1.hp = @p1_HP
		@p2.hp = @p2_HP
		####################
		@var = 0
		@winner = 0
		@winner_hand = 0
		@cnt = 0
		####################
	end

	def showHands # 出す手のみを表示するメソッド（キャラは別で定義したほうがよい?）
		@p1.play
		@p2.play
	end

	def showChara
		@p1.showChara
		@p2.showChara
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
				currentHP(@winner, @winner_hand)
			elsif var == 1 || var == -2
				puts "P2の勝ちです"
				@winner = 2
				@winner_hand = @p2.push_key
				currentHP(@winner, @winner_hand)
			elsif var == 0
				puts "あいこです"
			end
			p "------------------->8-------------------"
		end
	end

	def timeLimit
		# 時間制限にかかる終了条件
		if @timer > 600
			@end = true #1回あたりの終了条件は満たしている
			if @p1.push_key != 0 && @p2.push_key == 0
				@winner = 1
				@winner_hand = @p1.push_key
				currentHP
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


	def currentHP(winner, winner_hand)
		p @p1.hp
		p @p2.hp
		if winner == 1 #p1が勝利なら
			if winner_hand == 1 # グーなら
				dmg = @p1.c_gu[0] * @p1.atk
				@p2.hp -= dmg
			elsif winner_hand == 2 # チョキなら
				dmg = @p1.c_ti[0] * @p1.atk
				@p2.hp -= dmg
			elsif winner_hand == 3 # パーなら
				dmg = @p1.c_pa[0] * @p1.atk
				@p2.hp -= dmg
			end
			p "p2"
			p @p2.hp

		elsif winner == 2 #p2が勝利なら
			if winner_hand == 1 # グーなら
				dmg = @p2.c_gu[0] * @p2.atk
				@p1.hp -= dmg
			elsif winner_hand == 2 # チョキなら
				dmg = @p2.c_ti[0] * @p2.atk
				@p1.hp -= dmg
			elsif winner_hand == 3 # パーなら
				dmg = @p2.c_pa[0] * @p2.atk
				@p1.hp -= dmg
			end
			p "p1"
			p @p1.hp
		end
	end

end
