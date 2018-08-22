require_relative 'character'

class Python < Character
    def hands
        {
            gu: [1.0,  "パイソニスタ"],
            ti: [1.25, "モンティ・パイソン"],
            pa: [1.0,  "ヴァンロッサム"]
        }
    end
end

# 確認用
python = Python.new("Pyhton", 100, 10, "異常")
print python.name, "\n"
print python.status, "\n"
python.printHands