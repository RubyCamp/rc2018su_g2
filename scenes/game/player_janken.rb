require 'dxruby'

class Player < Sprite
  def initialize
		@gu = Image.load('images/game/gu.png')
		@ti = Image.load('images/game/ti.png')
		@pa = Image.load('images/game/pa.png')
		@i = 0
		@chara = nil
  end

	#def selectCharacter(chara) # 呼ばれるときに選択したキャラクター情報代入
	#	@chara = Ruby.new("Ruby", 120, 10, "正常") if chara == 'Ruby'; p 'Ruby Selected.' 
	#	@chara = Python.new("Python", 100, 10, "正常") if chara == 'Python'; p 'Pyhton Selected'
	#	@chara = Perl.new("Perl", 100, 10, "正常") if chara == 'Perl'; 'Perl Selected'
	#	#@chara
	#end

	def push_key #グーチョキパーのデータを取る
		@i = 1 if Input.key_down?(keys[:gu]) #1 グー
		@i = 2 if Input.key_down?(keys[:ti]) #2 チョキ
		@i = 3 if Input.key_down?(keys[:pa]) #3 パー
		@i
	end

	def play #グーチョキパーの画像を選択
		Window.draw(50, 100, @gu) if @i == 1
		Window.draw(50, 100, @ti) if @i == 2
		Window.draw(50, 100, @pa) if @i == 3
	end

	
	private
  def keys #hash
    {
      gu:K_J, #カンマ忘れない
      ti:K_I,
      pa:K_L
    }
  end
end
