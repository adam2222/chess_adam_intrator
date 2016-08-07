require_relative '../piece'

class Pawn < Piece

  def to_s
   self.color == :black ?  " ♟ " : " ♙ "
  end

end
