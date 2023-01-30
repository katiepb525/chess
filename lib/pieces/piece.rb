# frozen_string_literal: true

require './lib/place'
require './lib/place_handler'

class Piece
  attr_reader :possible_directions

  def initialize
    @possible_directions = nil
  end

  def legal_moves
    "Oops, this object does not define it's legal_moves."
  end
end
