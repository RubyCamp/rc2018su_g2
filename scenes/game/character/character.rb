class Character
    attr_reader :hp
    def initialize(name="character")
        @name = name
        @hp = 100
        @atk = 20
        @status = "正常"
        getHandsParam
        print "initialized!\n"
    end

    def hp
      @hp
    end

    def getHandsParam # ジャンケンの手ごとのパラメータを初期化
        @gu = hands[:gu]
        @ti = hands[:ti]
        @pa = hands[:pa]
    end

    def hands # 技の倍率、技名をここに定義
        {
            gu: [1.0, "グー！"],
            ti: [1.0, "チー！"],
            pa: [1.0, "パー！"]
        }
    end

    def printHands #確認用.
        print @gu[0],", ",@gu[1],"\n"
        print @ti[0],", ",@ti[1],"\n"
        print @pa[0],", ",@pa[1],"\n"
    end

    def returnMaxHP
        @hp
    end
end

#ruby = Character.new("Ruby", 100, 10)
#ruby.returnName
#ruby.printHands
#print "----------->8-----------\n"
