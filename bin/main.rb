#!/usr/bin/env ruby
require_relative '../lib/game.rb'

class UserInterface
  def display_board(board)
    board.each_with_index do |row, j|
      row.each_with_index do |element, i|
        print "#{element}"
        print '|' if i < row.length-1
      end
      print "\n-----\n" if j < board.length-1
    end
    print "\n"
  end

  def ask_name(idx)
    puts "Enter name for player #{idx}"
    return gets.chomp
  end

  def ask_move(player)
    puts "Enter move for player #{player.id}. Select the number in the grid where you want to place your move"
    return gets.chomp
  end

  def display_score(players)
    players.each do |player|
      puts "Score for player #{player.id} :  #{player.score}"
    end
  end

  def repeat_match()
    loop do
      puts 'Play again? (y/n)'
      input = (gets.chomp).downcase
      return true if input == 'y'
      return false if input == 'n'
    end
  end

  def output_message(message)
    puts message
  end
end

ui = UserInterface.new
game = Game.new(ui)
game.start