# frozen_string_literal: true

# Manages creation of legal movesets from coordinates.
class PlaceHandler
  attr_reader :list

  def initialize(place = nil, curr_direction = nil)
    @place = place
    @curr_direction = curr_direction
    @result = []
    @list = []
  end

  def create_legal_moveset(possible_directions, place)
    @place = place
    possible_directions.each do |direction|
      curr_to_place = Place.new(direction[0], direction[1])
      @curr_direction = curr_to_place
      add_list
    end
  end

  def create_legal_moveset_straight(possible_directions, place)
    @place = place
    possible_directions.each do |direction|
      curr_to_place = Place.new(direction[0], direction[1])
      @curr_direction = curr_to_place
      add_list_x_and_y
    end
  end

  def create_legal_moveset_diag(possible_directions, place)
    @place = place
    possible_directions.each do |direction|
      curr_to_place = Place.new(direction[0], direction[1])
      @curr_direction = curr_to_place
      add_list_iterative(:xy)
    end
  end

  private

  def coordinate_invalid?
    result_x = @result[0]
    result_y = @result[1]
    result_x >= 8 || result_y >= 8 || result_x.negative? || result_y.negative?
  end

  def push_negative_or_positive?(place, curr_direction, idx)
    case curr_direction
    when 1
      place + curr_direction + idx
    when -1
      place + curr_direction - idx
    end
  end

  def mark_axis(axis, idx)
    curr_direction_x_coord = @curr_direction.x_coord
    curr_direction_y_coord = @curr_direction.y_coord
    place_x_coord = @place.x_coord
    place_y_coord = @place.y_coord

    case axis
    when :x
      @result.push(push_negative_or_positive?(place_x_coord, curr_direction_x_coord, idx))
      @result.push((place_y_coord + curr_direction_y_coord))
    when :y
      @result.push(place_x_coord + curr_direction_x_coord)
      @result.push(push_negative_or_positive?(place_y_coord, curr_direction_y_coord, idx))
    when :xy
      @result.push(push_negative_or_positive?(place_x_coord, curr_direction_x_coord, idx))
      @result.push(push_negative_or_positive?(place_y_coord, curr_direction_y_coord, idx))
    end
  end

  def add_list
    @result = []
    @result.push((@place.x_coord + @curr_direction.x_coord))
    @result.push((@place.y_coord + @curr_direction.y_coord))
    return if coordinate_invalid? || @result == [@place.x_coord, @place.y_coord]

    new_place = Place.new(@result[0], @result[1])
    @list.push(new_place)
  end

  def add_list_x_and_y
    case curr_direction.x_coord
    when 1, -1
      add_list_iterative(:x)
    end

    case curr_direction.y_coord
    when 1, -1
      add_list_iterative(:y)
    end
  end

  def add_list_iterative(axis)
    8.times do |idx|
      @result = []
      mark_axis(axis, idx)
      next if coordinate_invalid? || @result == [@place.x_coord, @place.y_coord]

      new_place = Place.new(@result[0], @result[1])
      @list.push(new_place)
    end
  end
end
