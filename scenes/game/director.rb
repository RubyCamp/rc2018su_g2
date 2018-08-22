require 'dxruby'
require_relative 'Janken'
require_relative 'player_janken'
require_relative 'player1_janken'
require_relative 'player2_janken'

module Game
  class Director
    attr_accessor :p1, :p2, :result
    def initialize
      self.p1 = Player1_janken.new
      self.p2 = Player2_janken.new
      self.result = Janken.new
    end

    def play
      self.p1.play
      p self.p1.push_key
      self.p2.play
      p self.p2.push_key
      self.result.judge
    end
  end
end

