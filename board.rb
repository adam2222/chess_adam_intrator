require_relative 'pieces/pawn'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/rook'
require_relative 'pieces/queen'
require_relative 'pieces/king'

require 'byebug'

class Board
  attr_accessor :grid

  def self.new_board
    grid = Array.new(8) { Array.new(8) }
    Board.add_pawns(grid, 1)
    Board.add_pawns(grid, 6)
    Board.add_first_row(grid, 0)
    Board.add_first_row(grid, 7)
  end

  def self.add_pawns(grid, row)
    row == 1? color = :black : color = :white

    grid[row].each_with_index do |_, idx|
      pawn = Pawn.new(color, [row, idx])
      grid[row][idx] = pawn
    end

    grid
  end

  def self.add_first_row(grid, row)
    row == 0 ? color = :black : color = :white

    grid[row].each_with_index do |_, idx|
      case idx
      when 0, 7
        grid[row][idx] = Rook.new(color, [row, idx])
      when 1, 6
        grid[row][idx] = Bishop.new(color, [row, idx])
      when 2, 5
        grid[row][idx] = Knight.new(color, [row, idx])
      when 3
        grid[row][idx] = Queen.new(color, [row, idx])
      when 4
        grid[row][idx] = King.new(color, [row, idx])
      end
    end

    grid
  end

  def initialize(grid = Board.new_board)
    @grid = grid
  end

  def in_bounds?(new_pos)
    new_pos.all? { |x| x.between?(0, 7) }
  end

  def move(from, to)
    # @grid[from] = nil
    # @grid[to] = piece
  end

  def [](row, column)
    @grid[row][column]
  end

  def []=(row, column, content)
    @grid[row][column] = content
  end

  private


end
