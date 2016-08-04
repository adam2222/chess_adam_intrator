require_relative '../piece'

class King < Piece

  def to_s
    self.color == :black ? " ♚ " : " ♔ "
  end

end
