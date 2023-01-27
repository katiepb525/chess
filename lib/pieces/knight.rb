# frozen_string_literal: true

require './lib/place'

# knight piece
# - moves any direction in an L shape
# - can 'hop' over other pieces
class Knight
  POSSIBLE_DIRECTIONS = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]].freeze

  # generate list of legal moves from a single place
  def legal_moves(place)
    list = []
    POSSIBLE_DIRECTIONS.each do |curr_direction|
      result = []
      result.push((place.x + curr_direction[0]))
      result.push((place.y + curr_direction[1]))

      next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

      new_place = Place.new(result[0], result[1])
      list.push(new_place)
    end
    list
  end
end

# place = Place.new(0,1)
# knight = Knight.new
# p knight.legal_moves(place)
