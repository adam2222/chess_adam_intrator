require_relative '../piece'
require_relative 'sliding'

class Rook < Piece
  include Sliding

  def to_s
    self.color == :black ? " ♜ " : " ♖ "
  end

  def directions
    HORIZONTAL
  end

end
