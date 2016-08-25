
# Chess!
# Adam M. Intrator
# 8/10/16
#
# To play against the computer using default names, load the 'chess.rb' file on
# the command line:
#    ruby chess.rb
#
# To play against the computer with a name of your choice, add your name and
# the word "Computer" or "computer" as arguments on the command line before
# loading the file:
#   ruby chess.rb player_name computer
#
# To play against a friend, add both names as arguments on the command line:
#   ruby chess.rb Player1 Player2

# Use arrows to move the cursor, 'return' to select a square or piece.
#
# Good luck!

############################

require_relative 'board'
require_relative 'display'
require_relative 'player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :display

  def initialize(player1 = "Adam", player2 = "Flatiron")
    @board = Board.new
    @display = Display.new(@board)
    determine_players(player1, player2)
    @current_player = :white
  end

  def determine_players(player1, player2)
    if player2.downcase == "computer" || player2 == "Flatiron"
      @players = {
        :white => Player.new(player1, :white, @display),
        :black => Computer.new("Flatiron", :black, @board)
    }
    else
      @players = {
        :white => Player.new(player1, :white, @display),
        :black => Player.new(player2, :black, @display)
      }
    end
  end

  def run
    display.welcome_screen

    until board.checkmate?(@current_player)
      begin
        initial_notifications
        from, to = player.select_move

        from_piece = board[from]
        to_piece = board[to]

        board.make_move(from, to) if from_piece.valid_move?(to)

        if player.class == Computer
          computer_notifications(from, from_piece, to, to_piece)
        end

      rescue StandardError => e
        display.reset_notfications
        notifications[:alerts] = e.message
        retry
      end

      switch_players
    end

    winner_notification
  end


  private

  def initial_notifications
    notifications[:player] = " #{player.name} (#{player.color}): "
    notifications[:instructions] = " Which piece would you like to move? "
    notifications[:alerts] = " Check! " if board.in_check?(@current_player)
  end

  def computer_notifications(from, from_piece, to, to_piece)
    if to_piece.nil?
      notifications[:instructions] = " Computer moved #{from_piece.name} from #{calc_col(from[1])}#{calc_row(from[0])} to #{calc_col(to[1])}#{calc_row(to[0])} "
    else
      notifications[:instructions] = " Computer attacked #{to_piece.name} with its #{from_piece.name} (#{calc_col(from[1])}#{calc_row(from[0])} to #{calc_col(to[1])}#{calc_row(to[0])}) "
    end

    notifications[:alerts] = " Check! " if board.in_check?(from_piece.opposing_color)

    display.render
    sleep(2)
  end

  def winner_notification
    display.notifications = {}
    winner = (@current_player = :white ? :black : :white)
    notifications[:winner] = "  Checkmate! #{@players[winner].name} wins."
    display.render
    puts "\n\n"
    sleep(2)
  end

  def notifications
    display.notifications
  end

  def player
    @players[@current_player]
  end

  def switch_players
    if @current_player == :white
      @current_player = :black
    else
      @current_player = :white
    end
  end

  def calc_row(row)
    8 - row
  end

  def calc_col(col)
    (65 + col).chr
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
