# frozen_string_literal: true

require './lib/symbols'

class Place
  include Symbols
  attr_reader :x_coord, :y_coord, :color_square

  def initialize(x_coord, y_coord, color_square = nil)
    @x_coord = x_coord
    @y_coord = y_coord
    @color_square = color_square
    @current_piece = nil
    @symbol = nil
  end

  def update_symbol
    case color_square
    when :dark
      @symbol = square_dark
    when :light
      @symbol = square_light
    end

    return unless square_available? == false

    @symbol = @current_piece.symbol
  end

  def square_available?
    @current_piece.nil?
  end
end
