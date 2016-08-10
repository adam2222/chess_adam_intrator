require_relative '../piece'
require_relative 'stepping'

class Pawn < Piece


  def to_s
   self.color == :black ?  " ♟ " : " ♙ "
  end

  def directions
    if color == :white
      if position[0] == 6
        [[-1, 0], [-2, 0]]
      else
        [[-1, 0]]
      end
    elsif color == :black
      if position[0] == 1
        [[1, 0], [2, 0]]
      else
        [[1, 0]]
      end
    end
  end

  def attacks
    if color == :white
      [[-1, -1], [-1, 1]]
    elsif color == :black
      [[1, -1], [1, 1]]
    end
  end

  def moves
    move_array = []

    curr_y, curr_x = self.position

    directions.each do |direction|
      step_y, step_x = direction
      move = [curr_y + step_y, curr_x + step_x]

      if board.in_bounds?(move) && board[move].nil?
        move_array << move
      end
    end

    attacks.each do |direction|
      step_y, step_x = direction
      move = [curr_y + step_y, curr_x + step_x]

      if board.in_bounds?(move) && !(board[move].nil?) && !(board[move].color == self.color)
        move_array << move
      end
    end

    move_array
  end

end
