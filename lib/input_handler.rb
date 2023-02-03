# frozen_string_literal: true

# Manages player input.
class InputHandler
  attr_reader :chosen_piece, :chosen_place

  FILES = %w[a b c d e f g h].freeze
  RANKS = %w[1 2 3 4 5 6 7 8].freeze

  def initialize
    @notation = nil
    @chosen_piece = nil
    @chosen_place = nil
  end

  private

  # Player can select a piece and move it in two inputs 'g4' 'd2'
  # Player can select a piece and move in it one string 'g4d2'
  def notation_is_valid?
    @notation.length == 2 && @notation.length == 4
    case @notation.length
    when 2
      FILES.include?(@notation[0])
      RANKS.include?(@notation[1])
      @notation[0..1] != @chosen_piece # should throw an error when triggered
    when 4
      FILES.include?(@notation[0])
      RANKS.include?(@notation[1])
      FILES.include?(@notation[2])
      RANKS.include?(@notation[3])
      @notation[0..1] != @notation[2..3] # should throw an error when triggered
    else
      false
    end
  end

  # Uses a modified form of algebraic notation to determine moves.
  def notation_to_coordinates
    return unless notation_is_valid?

    coordinates = { x_coord: nil, y_coord: nil }
    case @notation.length
    when 2
      coordinates[:x_coord] = file_to_coordinate(@notation[0])
      coordinates[:y_coord] = rank_to_coordinate(@notation[1])
      @chosen_piece.nil? ? @chosen_piece = coordinates : @chosen_place = coordinates
    when 4
      coordinates[:x_coord] = file_to_coordinate(@notation[0])
      coordinates[:y_coord] = rank_to_coordinate(@notation[1])
      @chosen_place = coordinates.clone
      coordinates.clear
      coordinates[:x_coord] = file_to_coordinate(@notation[2])
      coordinates[:y_coord] = rank_to_coordinate(@notation[3])
      @chosen_place = coordinates.clone
    end
  end

  def file_to_coordinate(notation_idx)
    FILES.index(notation_idx)
  end

  def rank_to_coordinate(notation_idx)
    RANKS.index(notation_idx)
  end
end
