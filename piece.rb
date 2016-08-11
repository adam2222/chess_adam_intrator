
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
    # implemented by subclasses/modules
  end


  def valid_move?(to)
    all = moves
    valid = valid_moves

    if valid.include?(to)
      return true
    elsif all.include?(to)
      raise " Invalid: move puts you in check. "
    elsif board[to] && board[to].color == self.color
      raise " Invalid: you cannot attack your own piece "
    else
      raise " Invalid: #{name} cannot move like that. "
    end
  end

  # Filters out moves that would put player in check
  def valid_moves
    moves.reject do |move|
      duped_board = board.dup
      equivalent_piece = duped_board[@position]

      equivalent_piece.position = move
      duped_board[move] = equivalent_piece
      duped_board[@position] = nil

      duped_board.in_check?(@color)
    end
  end


  def name
    "#{self.class}".downcase
  end


end
