require_relative "player_janken"

class Player2_janken < Player #classの名前を持たせる
	attr_reader :chara, :atk, :c_gu, :c_ti, :c_pa
	attr_accessor :hp
	def initialize(selectedCharacter =p2Chara)
		@gu = Image.load('images/game/gu.png')
		@ti = Image.load('images/game/ti.png')
		@pa = Image.load('images/game/pa.png')
		@i = 0
		@chara = nil

		#p selectedCharacter
		select(selectedCharacter)
		@hp = @chara.hp
    	@atk = @chara.atk
    	@c_gu = @chara.gu
    	@c_ti = @chara.ti
		@c_pa = @chara.pa
		
		@charaImage = Image.load('images/game/'+@chara.name+'.png')
  	end

	def select(seleChara) # 呼ばれるときに選択したキャラクター情報代入
		if seleChara == 'Ruby'
			@chara = Ruby.new("Ruby")
			#p 'Ruby Selected.' 
		elsif seleChara == 'Python'
			@chara = Python.new("Python") 
			#p 'Python Selected'
		elsif seleChara == 'Perl'
			@chara = Perl.new("Perl")
			#p 'Perl Selected'
		end
	end

	def set_hp
		@hp = @chara.hp
	end

	def showChara
		Window.draw(450, 100, @charaImage)
	end

	def play #継承したメソッド
		Window.draw(500, 400, @gu) if @i == 1
		Window.draw(500, 400, @ti) if @i == 2
		Window.draw(500, 400, @pa) if @i == 3
 	end
end
