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
        puts "Where would you like to move your #{selected_piece.name}?"
        to = display.get_input
      else
        puts "Please select your color (#{self.color})"
        from = display.get_input
        display.render
      end
    end

    [from, to]
  end

end
