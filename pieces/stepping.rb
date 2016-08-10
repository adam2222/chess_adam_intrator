
module Stepping

  def moves
    move_array = []

    current_pos = self.position
    curr_y, curr_x = current_pos

    directions.each do |direction|
      step_y, step_x = direction
      move = [curr_y + step_y, curr_x + step_x]

      if board.in_bounds?(move) && (board[move].nil? || !(board[move].color == self.color))
        move_array << move
      end
    end

    move_array
  end



end
