
require_relative 'board'
require_relative 'board'


class Game

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @board = Board.new
    @display = Display.new(@board)
    @current_player = :white
  end



end
