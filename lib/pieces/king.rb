# frozen_string_literal: true

require './lib/pieces/piece'

# King class stores information regarding kings.
# - May move one square in any direction.
# - Is not allowed to make a move that would put itself in check or checkmate.
class King < Piece
  def initialize
    super
    @possible_directions = [[1, 0], [-1, 0], [0, -1], [0, 1], [-1, 1], [1, 1], [-1, -1], [1, -1]]
  end

  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset(@possible_directions, place)
    place_handler.list
  end
end

# place = Place.new(3, 3)
# king = King.new
# p king.legal_moves(place)
