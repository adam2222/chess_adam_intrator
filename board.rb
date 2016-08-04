require_relative 'pieces/pawn'
require 'byebug'

class Board
  attr_accessor :grid

  def self.new_board
    grid = Array.new(8) { Array.new(8) }


    # Pawns
    grid[1].each_with_index  do |_, idx|
      pawn = Pawn.new(:black, [1, idx])
      grid[1][idx] = pawn
    end

    grid
  end

  def initialize(grid = Board.new_board)
    @grid = grid
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
end
