require 'colorize'
require_relative 'key_reader'

class Display
  include Cursorable

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @flatiron_cells = [
      [5, 0],
      [4, 1],
      [3, 2],
      [2, 3],
      [1, 4],
      [5, 2],
      [4, 3],
      [3, 4],
      [2, 5],
      [1, 6]
    ]
  end

  def build_display_grid
    @board.grid.map.with_index do |row, row_number|
      row.map.with_index do |element, col_number|
        if element.nil?
          params = determine_color(row_number, col_number)
          "   ".colorize(params)
        else
          params = determine_color(row_number, col_number)
          element.to_s.colorize(params)
        end
      end
    end
  end

  def determine_color(row, column)
    if [row, column] == @cursor_pos
      { background: :red }
    elsif @flatiron_cells.include?([row, column])
      { background: :cyan }
    elsif row.odd?
      column.odd? ? { background: :white } : { background: :light_black }
    else
      column.odd? ? { background: :light_black } : { background: :white }
    end
  end

  def render
    puts ""
    build_display_grid.each_with_index do |row, idx|
      puts " #{8 - idx}| #{row.join}"
    end
    puts "    ------------------------"
    puts "     A  B  C  D  E  F  G  H"
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
