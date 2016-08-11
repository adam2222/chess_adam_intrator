
class Computer
  attr_reader :name, :color

  def initialize(name, color, board)
    @name, @color, @board  = name, color, board
  end

  def select_move
    pieces = select_pieces

    random_number = rand(pieces.count - 1)
    random_piece = pieces[random_number]
    moves = random_piece.valid_moves

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

  private

  def select_pieces
    pieces = []

    @board.grid.each do |row|
      row.each do |piece|
        if piece.nil?
          next
        elsif piece.color == color
          pieces  << piece
        end
      end
    end
    pieces
  end

end
