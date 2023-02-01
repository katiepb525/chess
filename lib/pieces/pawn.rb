require './lib/pieces/piece'

# can only move forward 
class Pawn < Piece
  def initialize
    super
    @possible_directions = [[0, 1]]
    @possible_directions_capture = [[-1, 1], [1, -1]]
  end

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

# place = Place.new(3, 3)
# pawn = Pawn.new
# p pawn.legal_moves(place)
