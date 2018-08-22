class Character
    attr_accessor :name, :hp, :atk, :status, :gu, :ti, :pa
    def initialize(name="character", hp=100, atk=1, status="正常")
        self.name = name
        self.hp = hp
        self.atk = atk
        self.status = status
        getHandsParam
        print "initialized!\n"
    end

    def getHandsParam # ジャンケンの手ごとのパラメータを初期化
        self.gu = hands[:gu]
        self.ti = hands[:ti]
        self.pa = hands[:pa]
    end

    def hands # 技の倍率、技名をここに定義
        {
            gu: [1.0, "グー！"],
            ti: [1.0, "チー！"],
            pa: [1.0, "パー！"]
        }
    end
    
    def printHands #確認用.
        print self.gu[0],", ",self.gu[1],"\n"
        print self.ti[0],", ",self.ti[1],"\n"
        print self.pa[0],", ",self.pa[1],"\n"
    end
end

#ruby = Character.new("Ruby", 100, 10)
#ruby.returnName
#ruby.printHands
#print "----------->8-----------\n"