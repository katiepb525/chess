# frozen_string_literal: true

require './lib/place'

# rook piece
# - can move as far as possible in any straight direction
class Rook
  POSSIBLE_DIRECTIONS = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze

  # generate list of legal moves from single place
  def legal_moves(place)
    list = []
    POSSIBLE_DIRECTIONS.each do |curr_direction|
      case curr_direction[0]
      when 1
        8.times do |idx|
          result = []
          result.push((place.x + curr_direction[0] + idx))
          result.push((place.y + curr_direction[1]))
          next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

          list.push(result)
        end
      when -1
        8.times do |idx|
          result = []
          result.push((place.x + curr_direction[0] - idx))
          result.push((place.y + curr_direction[1]))
          next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

          list.push(result)
        end
      end

      case curr_direction[1]
      when 1
        8.times do |idx|
          result = []
          result.push((place.x + curr_direction[0]))
          result.push((place.y + curr_direction[1] + idx))
          next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

          list.push(result)
        end

      when -1
        8.times do |idx|
          result = []
          result.push((place.x + curr_direction[0]))
          result.push((place.y + curr_direction[1] - idx))
          next if result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?

          list.push(result)
        end
      end
    end

    list
  end
end

place = Place.new(3, 3)
rook = Rook.new
p rook.legal_moves(place)
