
class Computer
  attr_reader :name, :color

  def initialize(name, color, board)
    @name, @color, @board  = name, color, board
  end

  def select_move
    pieces = select_pieces
    attack = attack_moves?(pieces)

    attack ? attack : random_move(pieces)
  end

  private

  def select_pieces
    pieces = []

    @board.grid.each do |row|
      row.each do |piece|
        if piece.nil?
          next
        elsif piece.color == color
          pieces << piece
        end
      end
    end
    pieces
  end

  def attack_moves?(pieces)
    pieces.each do |piece|
      piece.valid_moves.each do |move|
        target_piece = @board[move]

        if move_creates_check?(piece, move)
          from = piece.position
          to = move
          return [from, to]
        elsif !target_piece.nil?
          from = piece.position
          to = move
          return [from, to]
        end

      end
    end
    false
  end

  def move_creates_check?(piece, move)
    duped_board = @board.dup
    duped_board.make_move(piece.position, move)
    duped_board.in_check?(piece.opposing_color)
  end

  def random_move(pieces)
    moves = []

    while moves.empty?
      random_number = rand(pieces.count - 1)
      random_piece = pieces[random_number]
      moves = random_piece.valid_moves
    end

    from = random_piece.position

    random_number = rand(moves.count - 1)
    to = moves[random_number]

    [from, to]
  end

end
