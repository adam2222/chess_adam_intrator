require_relative '../piece'
require_relative 'sliding'

class Queen < Piece
  include Sliding

  def to_s
    self.color == :black ? " ♛ " : " ♕ "
  end

  def directions
    HORIZONTAL + DIAGONAL
  end

end
