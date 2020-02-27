# require_relative '../bin/main.rb'
require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'match.rb'

class Game
  # include UserInterface
  def initialize(ui)
    @game_on = false
    @ui = ui
  end

  def start
    @players = []
    player1_name = @ui.ask_name(1)
    @players[0] = Player.new(player1_name,'X')
    player2_name = @ui.ask_name(2)
    @players[1] = Player.new(player2_name,'O')
    @game_on = true

    while @game_on
      match = Match.new(@players, @ui)
      match.start
      @ui.display_score(@players)
      @game_on = @ui.repeat_match
    end

  end

end