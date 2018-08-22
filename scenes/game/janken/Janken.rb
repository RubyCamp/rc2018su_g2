require_relative "player1_janken"
require_relative 'player2_janken'

class Janken
	attr_accessor :var, :p1, :p2 ,:winner ,:winner_hand
	def initialize
		self.p1 = Player1_janken.new
		self.p2 = Player2_janken.new
		self.var = 0
		self.winner = 0
		self.winner_hand = 0
	end

	def judge
		self.var = self.p1.push_key - self.p2.push_key
		var = self.var
		if self.p1.push_key != 0 && self.p2.push_key != 0
			if var == -1 || var == 2
				puts "P1の勝ちです"
				self.winner = 1
				self.winner_hand = self.p1.push_key
			elsif var == 1 || var == -2
				puts "P2の勝ちです"
				self.winner = 2
				self.winner_hand = self.p2.push_key
			elsif var == 0
				puts "あいこです"
			end
		end
	end
end
