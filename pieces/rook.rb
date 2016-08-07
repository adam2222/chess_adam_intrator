require_relative '../piece'

class Rook < Piece

  def to_s
    self.color == :black ? " ♜ " : " ♖ "
  end


end
