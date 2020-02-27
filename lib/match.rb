require_relative '../bin/main.rb'
require_relative 'player.rb'
require_relative 'board.rb'

class Match
  include UserInterface

  def initialize(players)
    @players = players
    @current_player  = players[0]
    @board = Board.new
  end

  def get_move
    loop do
      move = ask_move(@current_player).to_i
      break if @board.apply_move?(@current_player.character, move)
    end
  end

  def start
    match_finished = false
    @board.display
    until match_finished do
      get_move
      @board.display
      case @board.board_completed(@current_player)
        when 1
          output_message("Congratulations player #{@current_player.id}, you won!")
          match_finished = true
          @current_player.score += 1
        when 2
          output_message("Match draw!")
          match_finished = true
        when 0
          @current_player = @current_player == @players[0] ? @players[1] : @players[0]
      end
    end
  end
end

player1 = Player.new(1, "O")
player2 = Player.new(2, "X")

players = [player1, player2]

my_match = Match.new(players)
my_match.start
