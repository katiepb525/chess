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

  def light_or_dark_square?(idx)
    return :dark if idx.odd?

    idx.even?
    :light
  end

  def create_grid
    grid = Array.new(8) { Array.new(8) { 'O' } }

    grid.each_with_index do |row, row_idx|
      row.each_with_index.map do |_, column_idx|
        grid[row_idx][column_idx] = Place.new(row_idx, column_idx, light_or_dark_square?(column_idx))
        grid[row_idx][column_idx].update_symbol
      end
    end
  end
end

# board = Board.new
# p board.grid
