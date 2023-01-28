# frozen_string_literal: true
require './lib/pieces/piece'
require './lib/place'

# rook piece
# - can move as far as possible in any straight direction
class Rook < Piece
  attr_reader :possible_directions

  def initialize
    super
    @possible_directions = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze
  end

  def push_negative_or_positive?(place, curr_direction, idx)
    case curr_direction
    when 1
      place + curr_direction + idx
    when -1
      place + curr_direction - idx
    end
  end

  def mark_x_axis(place, curr_direction, list)
    8.times do |idx|
      result = []
      result.push(push_negative_or_positive?(place.x_coord, curr_direction[0], idx))
      result.push((place.y_coord + curr_direction[1]))
      next if coordinate_invalid?(result)

      list.push(result)
    end
  end

  def mark_y_axis(place, curr_direction, list)
    8.times do |idx|
      result = []
      result.push(place.x_coord + curr_direction[0])
      result.push(push_negative_or_positive?(place.y_coord, curr_direction[1], idx))
      next if coordinate_invalid?(result)

      list.push(result)
    end
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    list = []
    possible_directions.each do |curr_direction|
      case curr_direction[0]
      when 1
        mark_x_axis(place, curr_direction, list)
      when -1
        mark_x_axis(place, curr_direction, list)
      end

      case curr_direction[1]
      when 1
        mark_y_axis(place, curr_direction, list)
      when -1
        mark_y_axis(place, curr_direction, list)
      end
    end
    list
  end
end

place = Place.new(3, 3)
rook = Rook.new
p rook.legal_moves(place)
