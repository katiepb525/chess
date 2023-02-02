# frozen_string_literal: true

require './lib/pieces/piece'
require './lib/place'

# Knight piece stores information regarding knights.
# - Moves any direction in an L shape.
# - Can 'hop' over other pieces.
class Knight < Piece
  attr_reader :possible_directions

  def initialize
    super
    @possible_directions = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze
    @place_handler = nil
  end

  # generate list of legal moves from a single place
  def legal_moves(place)
    place_handler = PlaceHandler.new(place)
    possible_directions.each do |curr_direction|
      curr_to_place = Place.new(curr_direction[0], curr_direction[1])
      place_handler.curr_direction = curr_to_place
      place_handler.mark_l_shape
    end
    place_handler.list
  end
end

# place = Place.new(0,1)
# knight = Knight.new
# p knight.legal_moves(place)
