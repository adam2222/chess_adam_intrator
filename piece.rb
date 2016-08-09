# require_relative 'pieces/pawn'


class Piece
  attr_accessor :color, :position, :board

  def initialize(color, position, board)
    @color, @position, @board = color, position, board
  end

  DIAGONAL = [[-1, -1], [1, 1], [1, -1], [-1, 1]]
  HORIZONTAL = [[1, 0],[-1, 0], [0, 1], [0, -1]]
  KNIGHT = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

  def in_bounds?(move)
    x, y = move
    x.between?(0, 7) && y.between?(0, 7)
  end

  def moves
    # implemented by subclass
  end


  def valid_move?(to)
    return true if valid_moves.include?(to)
    raise " Invalid move "
    # if self.board[to].color == self.color
    #     raise " You cannot attack your own piece "
    # elsif in_check?(pos)
    #     raise " Invalid: this move puts you in check. "
    # end
  end

  def valid_moves
    moves
    # moves.reject do |pos|
    #   piece = board[pos]
    #
    #   # if piece.nil?
    #   #   in_check?(pos)
    #   # else
    #   #   piece.color == self.color
    #   # end
    # end
  end


  def name
    "#{self.class}".downcase
  end

end
