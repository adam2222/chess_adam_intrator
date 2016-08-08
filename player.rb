require_relative 'display'
require 'byebug'

class Player
  attr_reader :color, :display

  def initialize(name, color, display)
    @name, @color, @display = name, color, display
  end

  def select_move
    from = nil
    to = nil

    until from && to
      if from
        selected_piece = display.board[from[0], from[1]]
        puts ""
        puts "    " + "#{@name} (#{self.color}):".colorize({style: :bold, background: :cyan})
        puts "    " + "Where would you like to move your #{selected_piece.name}?".colorize({background: :cyan})
        to = display.get_input
        display.render
      else
        puts ""
        puts "    " + "#{@name} (#{self.color}):".colorize({style: :bold, background: :cyan})
        puts "    " + "Which piece would you like to move?".colorize({background: :cyan})
        from = display.get_input
        display.render
      end
    end

    display.selected_square = nil
    [from, to]
  end

end
