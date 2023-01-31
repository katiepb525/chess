require './lib/pieces/piece'

class Bishop < Piece
  def initialize
    super
    @possible_directions = [[1, -1],[-1, 1],[-1, -1],[1, 1],]
    @place_handler = nil
  end

  # generate list of legal moves from single place
  def legal_moves(place)
    place_handler = PlaceHandler.new(place)
    possible_directions.each do |curr_direction|
      curr_to_place = Place.new(curr_direction[0], curr_direction[1])
      place_handler.curr_direction = curr_to_place
      place_handler.mark_all_diagonals
    end 
    place_handler.list
  end
end


# place = Place.new(3, 3)
# bishop = Bishop.new
# p bishop.legal_moves(place)
