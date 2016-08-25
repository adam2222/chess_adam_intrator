require_relative 'pieces/pawn'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'

class Board
  attr_accessor :grid

  def initialize(grid = new_board)
    @grid = grid
  end

  def in_bounds?(new_pos)
    new_pos.all? { |x| x.between?(0, 7) }
  end

  def make_move(from, to)
    piece = self[from]
    self[to] = piece
    piece.position = to
    self[from] = nil
  end

  def [](position)
    row, column = position
    @grid[row][column]
  end

  def []=(position, content)
    row, column = position
    @grid[row][column] = content
  end

  def checkmate?(color)
    pieces = select_pieces(color)
    in_check?(color) && pieces.all? { |piece| piece.valid_moves.empty? }
  end

  def in_check?(color)
    king_position = find_king(color).position
    color == :white ? opposing_color = :black : opposing_color = :white
    any_pieces_check?(opposing_color, king_position)
  end

  def dup
    dup_grid = Array.new(8) { Array.new(8) }
    dup_board = Board.new(dup_grid)

    grid.each_with_index do |row, y|
      row.each_with_index do |piece, x|
        next if piece.nil?
        dup_board[[y, x]] = piece.class.new(piece.color, piece.position, dup_board)
      end
    end
    dup_board
  end

  private

  def find_king(color)
    grid.each do |row|
      row.each do |piece|
        if piece.nil?
          next
        elsif piece.class == King && piece.color == color
          return piece
        end
      end
    end
  end

  def any_pieces_check?(opposing_color, king_position)
    grid.each do |row|
      row.each do |piece|
        if piece.nil?
          next
        elsif piece.color == opposing_color
          return true if piece.moves.include?(king_position)
        end
      end
    end
    false
  end

  def calc_row(row)
    8 - row
  end

  def calc_col(col)
    (65 + col).chr
  end

  def new_board
    grid = Array.new(8) { Array.new(8) }
    add_pawns(grid, 1)
    add_pawns(grid, 6)
    add_first_row(grid, 0)
    add_first_row(grid, 7)
  end

  def add_pawns(grid, row)
    row == 1? color = :black : color = :white

    grid[row].each_with_index do |_, idx|
      pawn = Pawn.new(color, [row, idx], self)
      grid[row][idx] = pawn
    end

    grid
  end

  def add_first_row(grid, row)
    row == 0 ? color = :black : color = :white

    grid[row].each_with_index do |_, idx|
      case idx
      when 0, 7
        grid[row][idx] = Rook.new(color, [row, idx], self)
      when 1, 6
        grid[row][idx] = Knight.new(color, [row, idx], self)
      when 2, 5
        grid[row][idx] = Bishop.new(color, [row, idx], self)
      when 3
        grid[row][idx] = Queen.new(color, [row, idx], self)
      when 4
        grid[row][idx] = King.new(color, [row, idx], self)
      end
    end

    grid
  end

  def select_pieces(color)
    pieces = []

    grid.each do |row|
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
