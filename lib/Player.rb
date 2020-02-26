require '../bin/main.rb'

class Player
  attr_reader :id
  attr_accessor :score

  def initialize(id)
    @id = id
    @score = 0
  end
end