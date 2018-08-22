class Player < Sprite
  def initialize(*args)
		super(*args)
		@gu = Image.load('images/gu.png')
		@ti = Image.load('images/ti.png')
		@pa = Image.load('images/pa.png')
		@i = 0
  end

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

  def keys #hash
    {
      gu:K_LEFT, #カンマ忘れない
      ti:K_UP,
      pa:K_RIGHT
    }
  end
end
