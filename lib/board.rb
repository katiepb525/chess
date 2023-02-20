# frozen_string_literal: true

require './lib/place'

# Chess board class stores infromation about the board.
# - Initalizes starting places of pieces.
# - Stores information about each square, it's color (light or dark), whether its occupied by a piece,
class Board
  attr_accessor :grid

  def initialize
    @grid = create_grid
  end

  private

  def light_or_dark_square?(column_idx, row_idx)
    if row_idx.even?
      return :light if column_idx.even?

      column_idx.odd?
      :dark
    elsif row_idx.odd?
      return :dark if column_idx.even?

      column_idx.odd?
      :light
    end
  end

  def create_grid
    grid = Array.new(8) { Array.new(8) { 'O' } }

    grid.each_with_index do |row, row_idx|
      row.each_with_index.map do |_, column_idx|
        grid[row_idx][column_idx] = Place.new(column_idx, row_idx, light_or_dark_square?(column_idx, row_idx)) 
        # because its an adjacency matrix, 
        # you have to access spots on the grid with the y coord first. e.g. grid[y_coord][x_coord]
        grid[row_idx][column_idx].update_symbol
      end
    end
  end
end

# board = Board.new
# p board.grid
