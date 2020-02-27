require_relative '../bin/main.rb'
require_relative 'board.rb'
require_relative 'player.rb'

class Match
  include UserInterface

  def initialize(players)
    @players = players
    @current_player  = players[0]
    @board = Board.new
  end

  def get_move
    loop do
      move = ask_move(@current_player)
      break if Board.apply_move(@current_player.character, move)
    end
    move
  end

  def start
    match_finished = false
    until match_finished do
      get_move
      if Board.board_completed?(@current_player)
        match_finished = true
      end
    end
  end
end

m = Match.new([1, 2])
