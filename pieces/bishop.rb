require_relative '../piece'
require_relative 'sliding'

class Bishop < Piece
  include Sliding

  def to_s
    self.color == :black ? " ♝ " : " ♗ "
  end

  def directions
    DIAGONAL
  end
  
end
