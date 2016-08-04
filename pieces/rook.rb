require_relative '../piece'

class Rook < Piece

  def to_s
    self.color == :black ? " ♜ " : " ♖ "
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

end
