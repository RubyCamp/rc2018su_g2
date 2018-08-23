require_relative 'character'

class Ruby < Character
    def initialize(name="character")
        @name = "Ruby"
        @hp = 200
        @atk = 50
        getHandsParam
    end
    def hands
        {
            gu: [1.5, "ルビースマッシュ"],
            ti: [1.0, "ルビーカッター"],
            pa: [1.0, "ルビービンタ"]
        }
    end
end
