require_relative '../piece'
require_relative 'stepping'

class Knight < Piece
  include Stepping

  def to_s
    self.color == :black ? " ♞ " : " ♘ "
  end

  def directions
    KNIGHT
  end

end
