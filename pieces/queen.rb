require_relative '../piece'

class Queen < Piece

  def to_s
    self.color == :black ? " ♛ " : " ♕ "
  end

end
