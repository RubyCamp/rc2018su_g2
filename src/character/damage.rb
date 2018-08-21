require_relative 'character'
require_relative 'ruby'
require_relative 'python'

p1 = Ruby.new("Ruby", 100, 10, "正常")
p2 = Python.new("Python", 100, 10, "正常")

def calcDamage(atk, mag)
    atk*mag
end

print "----------->8-----------\n"

print p2.name, "のHP：", p2.hp,"\n"
win = 1
hand = "gu"
if win == 1 and hand == "gu"
    print p1.name, "がグーで勝利！", "\n"
    print p1.name, "の基礎攻撃力",p1.atk, "\n"
    print p1.name, "のグーの倍率",p1.gu[0], "\n"
    print Integer(p1.atk * p1.gu[0]), "のダメージ！", "\n"
    p2.hp -= p1.atk * p1.gu[0]
end
print p2.name, "のHP：", p2.hp,"\n"