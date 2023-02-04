# frozen_string_literal: true

require './lib/pieces/piece'

# Rook class stores information regarding rooks.
# - Can move as far as possible in any straight direction.
class Rook < Piece
  def initialize
    super
    @possible_directions = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze
    @symbol = assign_symbol(rook_light, rook_dark)
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset_straight(@possible_directions, place)
    place_handler.list
  end
end

# place = Place.new(0, 0)
# rook = Rook.new
# p rook.legal_moves(place)
