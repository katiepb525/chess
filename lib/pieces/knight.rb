# frozen_string_literal: true
require './lib/pieces/piece'
require './lib/place'

# knight piece
# - moves any direction in an L shape
# - can 'hop' over other pieces
class Knight < Piece
  attr_reader :possible_directions

  def initialize
    super
    @possible_directions = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze
  end

  # generate list of legal moves from a single place
  def legal_moves(place)
    list = []
    possible_directions.each do |curr_direction|
      result = []
      result.push((place.x_coord + curr_direction[0]))
      result.push((place.y_coord + curr_direction[1]))

      next if coordinate_invalid?(result)

      new_place = Place.new(result[0], result[1])
      list.push(new_place)
    end
    list
  end
end

# place = Place.new(0,1)
# knight = Knight.new
# p knight.legal_moves(place)
