require_relative 'display'
require 'byebug'

class Player
  attr_reader :name, :color, :display

  def initialize(name, color, display)
    @name, @color, @display = name, color, display
  end

  def select_move
    from = nil
    to = nil

    # display#get_input returns selected cursor position (or nil)
    until from && to
      # If "from" position has already been selected (not nil):
      if from
        display.reset_notfications

        selected = selected_piece(from)
        notifications[:instructions] = " Where would you like to move your #{selected.name}? "

        to = select_pos
      # If neither "from" or "to" positions have been selected
      else
        begin
          from = select_pos
          until selected_piece(from) && selected_piece(from).color == self.color
              display.reset_notfications
              raise " Please select a #{self.color} piece "
          end
        rescue StandardError => e
          notifications[:errors] = e.message
          retry
        end

        from
      end
    end

    display.selected_square = nil
    [from, to]
  end

  def notifications
    display.notifications
  end

  def select_pos
    selected = nil

    until selected
      selected = display.get_input
      display.render
    end
    selected
  end

  def selected_piece(pos)
    display.board[pos[0], pos[1]]
  end

end
