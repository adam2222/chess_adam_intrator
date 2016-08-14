
require_relative 'key_reader'

class Display
  include KeyReader

  attr_accessor :board, :selected_square, :notifications

  def initialize(board)
    @board = board
    @cursor_pos = [6, 0]
    @selected_square = nil
    @flatiron_squares = [
      [5, 0],
      [4, 1],
      [3, 2],
      [2, 3],
      [1, 4],
      [5, 2],
      [4, 3],
      [3, 4],
      [2, 5],
      [1, 6]
    ]
    @notifications = {player: nil, instructions: nil, errors: nil}
  end

  # Creates a new array: printable (displayable) version of @board.grid

  def build_display_grid
    @board.grid.map.with_index do |row, row_number|
      row.map.with_index do |element, col_number|
        params = determine_color(row_number, col_number)
        if element.nil?
          "   ".colorize(params)
        else
          element.to_s.colorize(params)
        end
      end
    end
  end


  def determine_color(row, column)
    if [row, column] == @selected_square
      { background: :red }
    elsif [row, column] == @cursor_pos
      { background: :purple }
    elsif @flatiron_squares.include?([row, column])
      { background: :cyan }
    elsif (row + column).even?
      { background: :white }
    else
      { background: :light_black }
    end
  end

  # Prints out display grid to console
  def render
    system("clear")
    puts "\n\n"

    build_display_grid.each_with_index do |row, idx|
      puts " #{8 - idx} │ #{row.join}"
    end

    puts "     ────────────────────────"
    puts "      A  B  C  D  E  F  G  H"
    puts ""

    if notifications[:player]
      puts "    " + notifications[:player].colorize({style: :bold, background: :cyan})
    end

    if notifications[:instructions]
      puts "    " + notifications[:instructions].colorize({background: :cyan})
    end

    if notifications[:alerts]
      puts "    " + notifications[:alerts].colorize({background: :purple})
    end

    if notifications[:winner]
      puts "    " + notifications[:winner].colorize({foreground: :cyan, style: :bold})
    end
  end

  def welcome_screen
    system("clear")
    puts "\n\n"

    puts "    " + " Chess!                      ".colorize(background: :cyan, style: :bold) + " ".colorize(background: :light_cyan) + " ".colorize(background: :cyan) + " ".colorize(background: :light_cyan) + "    ".colorize(background: :cyan)

    puts "    " + " by Adam Intrator, Flatiron ".colorize(background: :cyan) + "h".colorize(background: :light_cyan) + "o".colorize(background: :cyan) + "p".colorize(background: :light_cyan) + "eful ".colorize(background: :cyan)

    puts "    " + "                           ".colorize(background: :cyan) + " ".colorize(background: :light_cyan) + " ".colorize(background: :cyan) + " ".colorize(background: :light_cyan) +  "      ".colorize(background: :cyan)

    puts "    " + " Press return to begin    ".colorize(background: :cyan) + " ".colorize(background: :light_cyan) + " ".colorize(background: :cyan) + " ".colorize(background: :light_cyan) + "       ".colorize(background: :cyan)

    until read_char == "\r"
      sleep
    end
  end

  def reset_notfications
    notifications[:instructions] = nil
    notifications[:alerts] = nil
  end

end


# Monkey-patched String class with custom 'colorize' method
class String
  def colorize(params)

    if params[:background] == :light_black
      "\e[0;39;100m#{self}\e[0m"
    elsif params[:background] == :white
      "\e[0;39;47m#{self}\e[0m"
    elsif params[:background] == :cyan && params[:style] == :bold
      "\e[1;39;46m#{self}\e[0m"
    elsif params[:background] == :cyan
      "\e[0;39;46m#{self}\e[0m"
    elsif params[:background] == :light_cyan
      "\e[0;39;48;5;123m#{self}\e[0m"
    elsif params[:background] == :red
      "\e[0;39;41m#{self}\e[0m"
    elsif params[:background] == :purple
      "\e[48;5;129m#{self}\e[0m"
    elsif params[:foreground] == :cyan && params[:style] == :bold
      "\e[1;36m#{self}\e[0m"
    end

  end
end
