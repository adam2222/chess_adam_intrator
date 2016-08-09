# require_relative 'pieces/pawn'

class Piece
  attr_accessor :color, :position, :board

  def initialize(color, position)
    @color, @position, @board = color, position, board

  end

  def moves

  end

  def valid_move?(from, to)
    if self.moves.include?(to)
      if board[to].empty? || !board[to].color == self.color
        return true
      else
        raise "You cannot attack your own piece"
      end
    end

    raise "Invalid move"
  end




  def name
    "#{self.class}".downcase
  end

end
