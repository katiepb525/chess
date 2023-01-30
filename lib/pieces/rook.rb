# frozen_string_literal: true

require './lib/pieces/piece'

# rook piece
# - can move as far as possible in any straight direction
class Rook < Piece
  attr_reader :possible_directions
  attr_accessor :place_handler

  def initialize
    super
    @possible_directions = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze
    @place_handler = nil
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new(place)
    possible_directions.each do |curr_direction|
      curr_to_place = Place.new(curr_direction[0], curr_direction[1])
      place_handler.curr_direction = curr_to_place
      place_handler.mark_x_and_y_axis
    end
    place_handler.list
  end
end

# place = Place.new(0, 0)
# rook = Rook.new
# p rook.legal_moves(place)
