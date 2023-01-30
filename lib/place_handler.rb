require 'pry-byebug'

# Organizes and assists in creating list of coordinates from a given place on the chess board.
class PlaceHandler
  attr_reader :place
  attr_accessor :curr_direction, :result, :list

  def initialize(place = nil, curr_direction = nil, result = [], list = [])
    @place = place
    @curr_direction = curr_direction
    @result = result
    @list = list
  end

  def coordinate_invalid?(result)
    result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?
  end

  def push_negative_or_positive?(place, curr_direction, idx)
    case curr_direction
    when 1
      place + curr_direction + idx
    when -1
      place + curr_direction - idx
    end
  end

  def mark_x_axis
    8.times do |idx|
      result = []
      result.push(push_negative_or_positive?(place.x_coord, curr_direction.x_coord, idx))
      result.push((place.y_coord + curr_direction.y_coord))
      next if coordinate_invalid?(result)

      list.push(result)
    end
  end

  def mark_y_axis
    8.times do |idx|
      result = []
      result.push(place.x_coord + curr_direction.x_coord)
      result.push(push_negative_or_positive?(place.y_coord, curr_direction.y_coord, idx))
      next if coordinate_invalid?(result)

      list.push(result)
    end
  end

  def mark_x_and_y_axis
    case curr_direction.x_coord
    when 1, -1
      mark_x_axis
    end

    case curr_direction.y_coord
    when 1, -1
      mark_y_axis
    end
  end

  def mark_l_shape
    result = []
    result.push((place.x_coord + curr_direction.x_coord))
    result.push((place.y_coord + curr_direction.y_coord))
    if !coordinate_invalid?(result)
      new_place = Place.new(result[0], result[1])
      list.push(new_place)
    end
  end
end