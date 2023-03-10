# frozen_string_literal: true

require './lib/symbols'
require './lib/place'
require './lib/place_handler'

# Parent class initalizing necessary methods/instance variables and dependencies.
class Piece
  include Symbols
  attr_reader :color, :can_hop
  attr_accessor :symbol

  def initialize(color = :light)
    @possible_directions = nil
    @color = color
    @symbol = nil
    @can_hop = false
  end

  def assign_symbol(sym1, sym2)
    case @color
    when :light
      @symbol = sym1
    when :dark
      @symbol = sym2
    end
  end

  def to_dark_color
    @color = :dark
  end

  def legal_moves
    "Oops, this object does not define it's legal_moves."
  end
end
