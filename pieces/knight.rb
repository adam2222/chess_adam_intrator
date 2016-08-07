require_relative '../piece'

class Knight < Piece

  def to_s
    self.color == :black ? " ♞ " : " ♘ "
  end

end
