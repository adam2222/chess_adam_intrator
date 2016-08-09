
require_relative 'board'
require_relative 'display'
require_relative 'player'
require 'byebug'


class Game
  attr_accessor :board, :display

  def initialize(player1 = "Adam", player2 = "Flatiron")
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      :white => Player.new(player1, :white, @display),
      :black => Player.new(player2, :black, @display)
    }
    @current_player = :white
  end

  def run
    # until board.checkmate?
    loop do
      notifications[:player] = " #{player.name} (#{player.color}): "
      notifications[:instructions] = " Which piece would you like to move? "
      display.render

      from, to = player.select_move
      # if board[to[0],to[1]].nil?
      #   raise "please choose an "
      board.make_move(from, to)
      switch_players
    end
  end

  def notifications
    display.notifications
  end

  def player
    @players[@current_player]
  end
  private

  def switch_players
    if @current_player == :white
      @current_player = :black
    else
      @current_player = :white
    end
  end


end


game = Game.new
game.run
