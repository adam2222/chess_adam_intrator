
class Computer
  attr_reader :name, :color

  def initialize(name, color, board)
    @name, @color, @board  = name, color, board
  end

  def select_move
    pieces = select_pieces

    check_move = check_move?(pieces)
    return check_move if check_move

    attack_move = attack_move?(pieces)
    return attack_move if attack_move

    random_move(pieces)
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

  def check_move?(pieces)
    pieces.each do |piece|
      piece.valid_moves.each do |move|
        duped_board = @board.dup
        from = piece.position
        to = move

        duped_board.make_move(from, to)
        return [from, to] if duped_board.in_check?(piece.opposing_color)
      end
    end
    false
  end
  
  def attack_move?(pieces)
    pieces.each do |piece|
      piece.valid_moves.each do |move|
        target_piece = @board[move]

        if !target_piece.nil?
          from = piece.position
          to = move
          return [from, to]
        end
      end
    end
    false
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
