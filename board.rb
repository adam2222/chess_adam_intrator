

class Board

  def new_board
    grid = Array.new(8) { Array.new(8, nil) }

  end

  def initialize(grid = new_board)
    @grid = grid
  end

  def move(start, end)
    Piece.position
  end

  def [](row, column)
    @grid[row][column]
  end

  def []=(row, column, content)
    @grid[row][column] = content
  end
end
