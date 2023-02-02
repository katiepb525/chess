# frozen_string_literal: true

require './lib/pieces/piece'

# Queen piece stores information regarding queens.
# - Can move as far as possible in any straight or diagonal direction
class Queen < Piece
  attr_reader :possible_directions_diag, :possible_directions_straight

  def initialize
    super
    @possible_directions_diag = [[1, -1], [-1, 1], [-1, -1], [1, 1]].freeze
    @possible_directions_straight = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze
    @place_handler = nil
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset_straight(@possible_directions_diag, place)
    place_handler.create_legal_moveset_diag(@possible_directions_straight, place)
    place_handler.list
  end
end

# place = Place.new(3, 3)
# queen = Queen.new
# p queen.legal_moves(place)
