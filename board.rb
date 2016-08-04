

class Board
  attr_accessor :grid
  
  def self.new_board
    grid = Array.new(8) { Array.new(8, nil) }
    # Fill with pieces
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
