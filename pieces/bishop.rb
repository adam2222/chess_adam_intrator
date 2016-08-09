require_relative '../piece'

class Bishop < Piece
  include Sliding

  def to_s
    self.color == :black ? " ♝ " : " ♗ "
  end

  def diagonal
    [
      [-1, -1],
      [1, 1],
      [1, -1],
      [-1, 1]
    ]
  end

  def moves(current_pos)

  end
end
