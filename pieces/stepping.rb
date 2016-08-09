
module Stepping

  def moves
    move_array = []

    current_pos = self.position
    curr_y, curr_x = current_pos

    directions.each do |direction|
      step_y, step_x = direction
      move_array << [curr_y + step_y, curr_x + step_x]
    end


    move_array
  end



end
