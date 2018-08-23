require_relative "player_janken"

class Player1_janken < Player
  attr_reader :chara, :atk, :c_gu, :c_ti, :c_pa
  attr_accessor :hp, :hitpoint
  def initialize(selectedCharacter = "")
		@gu = Image.load('images/game/gu.png')
		@ti = Image.load('images/game/ti.png')
    @pa = Image.load('images/game/pa.png')
    @i = 0
    @chara = nil
    @font = Font.new(40, font_name="ＭＳ ゴシック")

    #p selectedCharacter
    select(selectedCharacter) # 入力:選ばれたキャラの文字情報. 代入: Characterクラス.
    @hp = @chara.hp
    @atk = @chara.atk
    @c_gu = @chara.gu
    @c_ti = @chara.ti
    @c_pa = @chara.pa
    @hitpoint = HitPoint.new(10, 10, @chara.hp, 'left')
    @charaImage = Image.load('images/game/'+@chara.name+'.png')
    #p @chara
		#@currentHP
  end

  def showChara
    Window.draw(50, 100, @charaImage)
  end

  def showHP
    Window.draw_font(100, 20, @hp.to_s, @font)
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
			p 'Perl Selected'
    end
  end

  private
	def keys #hash
    {
      gu:K_A, #カンマ忘れない
      ti:K_W,
      pa:K_D
    }
  end

end
