require 'colorize'
require_relative 'key_reader'

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def make_display_grid
    @board.grid.map.with_index do |row, row_number|
      row.map.with_index do |element, col_number|
        if element.nil?
          params = determine_color(row_number, col_number)
          " ".colorize(params)
        else
          params = determine_color(row_number, col_number)
          element.to_s.colorize(params)
        end
      end
    end
  end

  def determine_color(row, column)

  end




end


#
# 8 ♜	♞	♝	♛	♚	♝	♞	♜
# 7	♟	♟	♟	♟	♟	♟	♟	♟
# 6
# 5
# 4
# 3
# 2	♙	♙	♙	♙	♙	♙	♙	♙
# 1	♖	♘	♗	♕	♔	♗	♘	♖
#   a	b	c	d	e	f	g	h
