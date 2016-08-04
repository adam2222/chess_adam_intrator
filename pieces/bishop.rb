require_relative '../piece'

class Bishop < Piece

  def to_s
    self.color == :black ? " ♝ " : " ♗ "
  end

end
#
# 8 ♜	♞	♝	♛	♚	♝	♞	♜
# 7	♟	♟	♟	♟	♟	♟	♟	♟
# 6
# 5
# 4
# 3
# 2	♙	♙	♙	♙	♙	♙	♙	♙
# 1	♖	♘	♗	♕	♔	♗	♘	♖
#   a	b	c	d	e	f	g	h
