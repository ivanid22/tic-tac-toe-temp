require '../bin/main.rb'

class Board
  #include UserInterface
  attr_reader :cells

  def initialize
    @cells = [['a', 'b', 'c'], ['b', 'a', 'a'], ['c', 'a', 'a']]
  end

  def board_completed(symbols)

    symbol_check = nil
    won = false
    symbol_won = nil

    0.upto(symbols.length - 1) do |s|
      symbol_check = symbols[s]

      #Check horizontal win
      @cells.each do |row|
        won = row.all?(symbol_check)
        return symbol_check if won
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
          if i == j
            diagonal_arr.push(@cells[i][j])
          end
          if j == @cells[i].length - i - 1
            rev_diagonal_arr.push(@cells[i][j])
          end
          j += 1
        end
        won = temp.all?(symbol_check)
        return symbol_check if won
        i += 1
      end
      print diagonal_arr
      print rev_diagonal_arr
      won = diagonal_arr.all?(symbol_check)
        return symbol_check if won
      won = rev_diagonal_arr.all?(symbol_check)
        return symbol_check if won
    end
    false
  end   
end

board = Board.new

sym = board.board_completed(['a', 'b'])
puts sym

