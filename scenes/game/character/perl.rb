require_relative 'character'

class Perl < Character
    def hands
        {
            gu: [1.10, "真珠湾戦争"],
            ti: [1.0,  "ぱるぱる"],
            pa: [1.10, "パール"]
        }
    end
end

# 確認用
perl = Perl.new("Perl", 120, 10, "異常")
print perl.name, "\n"
print perl.status, "\n"
perl.printHands