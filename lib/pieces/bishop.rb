# frozen_string_literal: true

require './lib/pieces/piece'

# Bishop class stores information regarding bishops.
# - Can move as far as possible in any diagonal direction.
class Bishop < Piece
  def initialize
    super
    @possible_directions = [[1, -1], [-1, 1], [-1, -1], [1, 1]].freeze
    @symbol = assign_symbol(bishop_light, bishop_dark)
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset_diag(@possible_directions, place)
    place_handler.list
  end
end

# place = Place.new(3, 3)
# bishop = Bishop.new
# p bishop.legal_moves(place)
