# require_relative 'pieces/pawn'

class Piece
  attr_accessor :color, :position

  def initialize(color, position)
    @color, @position = color, position

  end

  def valid_move?

  end

  def name
    "#{self.class}".downcase
  end

end
