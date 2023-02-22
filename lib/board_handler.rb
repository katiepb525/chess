# frozen_string_literal: true

Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
require './lib/board'

# Manages and updates information pertaining to the board.
class BoardHandler
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def set_up_board
    set_up_light_pieces
    set_up_dark_pieces
  end

  private

  # @color for pieces is :light by default.
  def set_up_light_pieces
    y_coord = 7
    assign_higher_rank(y_coord - 1)
    assign_lower_rank(y_coord)
  end

  def set_up_dark_pieces
    y_coord = 0
    assign_higher_rank(y_coord + 1)
    assign_lower_rank(y_coord)
    change_to_dark(y_coord + 1)
    change_to_dark(y_coord)
  end

  def assign_piece(x_coord, y_coord, piece)
    place = @board.grid[x_coord][y_coord]
    place.current_piece = piece
    place.update_symbol
  end

  def assign_higher_rank(y_coord)
    @board.grid[y_coord].each do |place|
      place.current_piece = Pawn.new
      place.update_symbol
    end
  end

  # might be too much of a brute force approach?
  def assign_lower_rank(y_coord)
    assign_piece(y_coord, 0, Rook.new)
    assign_piece(y_coord, 7, Rook.new)
    assign_piece(y_coord, 1, Knight.new)
    assign_piece(y_coord, 6, Knight.new)
    assign_piece(y_coord, 2, Bishop.new)
    assign_piece(y_coord, 5, Bishop.new)
    assign_piece(y_coord, 3, Queen.new)
    assign_piece(y_coord, 4, King.new)
  end

  def change_to_dark(y_coord)
    @board.grid[y_coord].each do |place|
      place.current_piece.to_dark_color
      place.update_symbol
    end
  end
end

# board_handler = BoardHandler.new
# board_handler.set_up_board
# board_handler.board.grid.each do |row|
#   symb_arr = []
#   row.each do |place|
#     symb_arr.push(place.symbol)
#   end
#   puts "#{symb_arr}\n"
#   symb_arr = []
# end
