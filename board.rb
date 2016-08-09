require_relative 'pieces/pawn'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'

require 'byebug'

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

  def in_check?(color)
    # self.dup
  end

  def checkmate?(color)

  end

  private

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
        grid[row][idx] = Bishop.new(color, [row, idx], self)
      when 2, 5
        grid[row][idx] = Knight.new(color, [row, idx], self)
      when 3
        grid[row][idx] = Queen.new(color, [row, idx], self)
      when 4
        grid[row][idx] = King.new(color, [row, idx], self)
      end
    end

    grid
  end

end
