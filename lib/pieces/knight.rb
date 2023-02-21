# frozen_string_literal: true

require './lib/pieces/piece'

# Knight class stores information regarding knights.
# - Moves any direction in an L shape.
# - Can 'hop' over other pieces.
class Knight < Piece
  def initialize
    super
    @possible_directions = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze
    @symbol = assign_symbol(knight_light, knight_dark)
    @can_hop = true
  end

  # generate list of legal moves from a single place
  def legal_moves(place)
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset(@possible_directions, place)
    place_handler.list
  end
end

# place = Place.new(0,1)
# knight = Knight.new
# p knight.legal_moves(place)
