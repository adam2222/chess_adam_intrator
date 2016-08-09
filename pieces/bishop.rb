require_relative '../piece'

class Bishop < Piece

  def to_s
    self.color == :black ? " ♝ " : " ♗ "
  end

  

end
