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
  end   
end

puts 'Hello World!'

board = [[1, 2, 3], [1, 2, 3], [1, 2, 3]]

UserInterface.display_board(board)