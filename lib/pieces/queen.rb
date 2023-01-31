require './lib/pieces/piece'

class Queen < Piece
  attr_reader :possible_directions_diag, :possible_directions_straight
  def initialize
    super
    @possible_directions_diag = [[1, -1], [-1, 1], [-1, -1], [1, 1]].freeze
    @possible_directions_straight = [[1, 0], [0, -1], [0, 1], [-1, 0]].freeze
    @place_handler = nil
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new(place)
    possible_directions_straight.each do |curr_direction|
      curr_to_place = Place.new(curr_direction[0], curr_direction[1])
      place_handler.curr_direction = curr_to_place
      place_handler.mark_x_and_y_axis
    end

    possible_directions_diag.each do |curr_direction|
      curr_to_place = Place.new(curr_direction[0], curr_direction[1])
      place_handler.curr_direction = curr_to_place
      place_handler.mark_all_diagonals
    end 
    place_handler.list
  end
end


# place = Place.new(3, 3)
# queen = Queen.new
# p queen.legal_moves(place)
