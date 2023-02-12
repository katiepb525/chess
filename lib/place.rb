# frozen_string_literal: true

require './lib/symbols'

# Place class stores information regarding the current square or 'place'.
class Place
  include Symbols
  attr_reader :x_coord, :y_coord, :color_square, :symbol
  attr_accessor :current_piece

  def initialize(x_coord, y_coord, color_square = nil)
    @x_coord = x_coord
    @y_coord = y_coord
    @color_square = color_square
    @current_piece = nil
    @symbol = nil
  end

  # To be called upon initalization of a board, or updating a place with a piece.
  def update_symbol
    case color_square
    when :dark
      @symbol = square_dark
    when :light
      @symbol = square_light
    end

    return unless square_available? == false

    update_piece
  end

  private

  def update_piece
    piece_name = @current_piece.class.name.downcase
    piece_light = "#{piece_name}_light".to_sym
    piece_dark = "#{piece_name}_dark".to_sym
    get_sym_light = send(piece_light)
    get_sym_dark = send(piece_dark)
    @symbol = @current_piece.assign_symbol(get_sym_light, get_sym_dark)
  end

  def square_available?
    @current_piece.nil?
  end
end
