require_relative '../piece'
require_relative 'stepping'

class Pawn < Piece
  include Stepping

  def to_s
   self.color == :black ?  " ♟ " : " ♙ "
  end

  def directions
    if color == :white
      if position[0] == 6
        [[-1, 0], [-2, 0]]
      else
        [[-1, 0]]
      end
    elsif color == :black
      if position[0] == 1
        [[1, 0], [2, 0]]
      else
        [[1, 0]]
      end
    end
  end

end
