
require_relative 'board'
require_relative 'display'
require 'byebug'


class Game
  attr_accessor :board, :display

  def run
    loop do
      display.render
      display.get_input

    end


  end

  def initialize(player1 = "Adam", player2 = "Kira")
    @player1, @player2 = player1, player2
    @board = Board.new
    @display = Display.new(@board)
    @current_player = :white
  end


end


game = Game.new
game.run
