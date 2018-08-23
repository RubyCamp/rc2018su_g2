require_relative 'character'

class Python < Character
    def initialize(name="character")
        @name = "Python"
        @hp = 20
        @atk = 80
        getHandsParam
    end

    def hands
        {
            gu: [1.0,  "パイソニスタ"],
            ti: [1.25, "モンティ・パイソン"],
            pa: [1.0,  "ヴァンロッサム"]
        }
    end
end
