require_relative 'character'

class Perl < Character
    def initialize(name="character")
        @name = "Perl"
        @hp = 60
        @atk =40
        getHandsParam
    end

    def hands
        {
            gu: [1.10, "真珠湾戦争"],
            ti: [1.0,  "ぱるぱる"],
            pa: [1.10, "パール"]
        }
    end
end