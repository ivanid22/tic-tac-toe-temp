require '../bin/main.rb'

class Board
  include UserInterface
  attr_reader :cells

  def initialize
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def board_completed(symbols)

    symbol_check = nil
    won = false
    symbol_won = nil

    0.up_to(symbols.length - 1) do |s|

      symbol_check = symbols[s]

      #Check horizontal win
      @cells.each do |row|
        won = row.all?(symbol_check)
      end
      #Check vertical win
      i = 0
      diagonal_arr = []
      rev_diagonal_arr = []
      while i < @cells.length

        temp = []
        j = 0
        while j < @cells[i].length
          temp.push(@cells[j][i])
          if i = j
            diagonal_arr.push(@cells[i][j])
          end
          if j = @cells[i].length - i - 1
            rev_diagonal_arr.push(@cells[i][j])
          end
          j += 1
        end
        won = temp.all?(symbol_check)
        i += 1
      end
      won = diagonal_arr.all?(symbol_check)
      won = rev_diagonal_arr.all?(symbol_check)
      
      return symbol_check if won == true

    end
    false
  end   
end