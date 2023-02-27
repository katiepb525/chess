# frozen_string_literal: true

require './lib/pieces/piece'

# Pawn class stores information regarding pawns.
# - Pawn can only move forward one square.
# - Pawn can only capture diagonally.
# - Promotion: When a pawn reaches the end of the board, it should be allowed promote to a queen, knight, or rook.
# - En-passant: If enemy pawn moves two squares on first move,
#   pawn may capture enemy pawn if enemy passed over a capturing square.
class Pawn < Piece
  def initialize
    super
    @possible_directions = [[0, -1]]
    @possible_directions_capture = [[-1, 1], [1, -1]]
    @symbol = assign_symbol(pawn_light, pawn_dark)
  end

  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset(@possible_directions, place)
    place_handler.list
  end

  def to_dark_color
    super
    @possible_directions = [[0, 1]]
    @possible_directions_capture = [[-1, 1], [1, 1]]
  end
end

# place = Place.new(3, 3)
# pawn = Pawn.new
# p pawn.legal_moves(place)
