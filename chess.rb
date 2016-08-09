
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

    until display.read_char == "\r"
      display.welcome_screen
    end
    # until board.checkmate?
    loop do
      begin
        notifications[:player] = " #{player.name} (#{player.color}): "
        notifications[:instructions] = " Which piece would you like to move? "
        display.render

        from, to = player.select_move
      rescue StandardError => e
        display.reset_notfications
        notifications[:errors] = e.message
        retry
      end

      # if valid_move?(from, to)
        board.make_move(from, to)
      # end
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

##################################

if __FILE__ == $PROGRAM_NAME

  if ARGV[0] && ARGV[1]
    game = Game.new(ARGV[0], ARGV[1])
  else
    game = Game.new
  end

  game.run
end
