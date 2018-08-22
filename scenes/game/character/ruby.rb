require_relative 'character'

class Ruby < Character
    def hands
        {
            gu: [1.5, "ルビースマッシュ"],
            ti: [1.0, "ルビーカッター"],
            pa: [1.0, "ルビービンタ"]
        }
    end
end

# 確認用
ruby = Ruby.new("Ruby", 100, 10, "正常")
print ruby.name, "\n"
print ruby.status, "\n"
ruby.printHands