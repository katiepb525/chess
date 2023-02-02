# frozen_string_literal: true

require './lib/place'
require './lib/place_handler'

# Parent class initalizing necessary methods/instance variables and dependencies.
class Piece
  attr_reader :color

  def initialize(color = :light)
    @possible_directions = nil
    @color = color
  end

  def legal_moves
    "Oops, this object does not define it's legal_moves."
  end
end
