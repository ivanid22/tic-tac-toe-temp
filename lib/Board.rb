require '../bin/main.rb'

class Board
  include UserInterface
  attr_reader :cells

  def initialize
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def board_completed?
    
  end   
end