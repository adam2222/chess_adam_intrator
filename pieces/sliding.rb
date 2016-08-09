
module Sliding
  # All possible moves for the piece on an empty board
  def moves
    move_array = []
    current_pos = self.position

    directions.each do |direction|
      step_y, step_x = direction

      curr_y, curr_x = current_pos
      current_pos = [curr_y + step_y, curr_x + step_x]

      while in_bounds?(current_pos)
        if board[current_pos].nil?
          move_array << current_pos
          curr_y, curr_x = current_pos
          current_pos = [curr_y + step_y, curr_x + step_x]
        elsif !(board[current_pos].color == self.color)
          move_array << current_pos
          break
        else
          raise "Cannot attack piece of the same color"
        end
      end
    end
    move_array
  end

end
