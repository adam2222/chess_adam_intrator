require_relative '../piece'
require_relative 'stepping'

class King < Piece
  include Stepping

  def to_s
    self.color == :black ? " ♚ " : " ♔ "
  end

  def directions
    HORIZONTAL + DIAGONAL
  end

end
