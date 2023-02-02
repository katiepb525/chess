# frozen_string_literal: true

require './lib/pieces/piece'

# Rook piece stores information regarding rooks.
# - Can move as far as possible in any straight direction.
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
    place_handler = PlaceHandler.new
    place_handler.create_legal_moveset_iterative(@possible_directions, place)
  end
end

# place = Place.new(0, 0)
# rook = Rook.new
# p rook.legal_moves(place)
