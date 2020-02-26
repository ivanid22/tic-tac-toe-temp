#!/usr/bin/env ruby

class UserInterface
  def self.display_board(board)
    board.each_with_index do |row, j|
      row.each_with_index do |element, i|
        print "#{element}"
        print '|' if i < row.length-1
      end
      print "\n-----\n" if j < board.length-1
    end
    print "\n"
  end
  def self.ask_move(player)
    puts "Enter move for player #{player[:id]}"
    return gets.chomp
  end

  def self.repeat_match()
    loop do
      puts 'Play again? (y/n)'
      input = (gets.chomp).downcase
      return true if input == 'y'
      return false if input == 'n'
    end
  end
  def self.output_message(message)
    puts message
  end
end

puts 'Hello World!'

player1 = {
  id: 1
}

board = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]

UserInterface.display_board(board)

move = UserInterface.ask_move(player1)


answer = UserInterface.repeat_match
puts answer