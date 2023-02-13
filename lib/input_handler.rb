# frozen_string_literal: true

# Manages player input.
class InputHandler
  attr_reader :chosen_piece, :chosen_place
  attr_accessor :notation

   RANKS = %w[a b c d e f g h].freeze
   FILES = %w[1 2 3 4 5 6 7 8].freeze

  def initialize
    @notation = nil
    @chosen_piece = nil
    @chosen_place = nil
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
      curr_file_1 = notation[1]
      curr_rank_1 = notation[0]
      curr_file_2 = notation[3]
      curr_rank_2 = notation[2]
      coordinates[:x_coord] = file_to_coordinate(curr_file_1)
      coordinates[:y_coord] = rank_to_coordinate(curr_rank_1)
      @chosen_piece = coordinates.clone
      coordinates.clear
      coordinates[:x_coord] = file_to_coordinate(curr_file_2)
      coordinates[:y_coord] = rank_to_coordinate(curr_rank_2)
      @chosen_place = coordinates.clone
    end
  end

  private

  # Player can select a piece and move it in two inputs 'g4' 'd2'
  # Player can select a piece and move in it one string 'g4d2'
  def notation_is_valid?
    @notation.length == 2 || @notation.length == 4
    case @notation.length
    when 2
      FILES.include?(@notation[1])
      RANKS.include?(@notation[0])
      @notation[0..1] != @chosen_piece # should throw an error when triggered
    when 4
      FILES.include?(@notation[1])
      RANKS.include?(@notation[0])
      FILES.include?(@notation[3])
      RANKS.include?(@notation[2])
      @notation[0..1] != @notation[2..3] # should throw an error when triggered
    else
      false
    end
  end

  def file_to_coordinate(notation_idx)
    7 - FILES.index(notation_idx) # because files are picked from bottom-up on board
  end

  def rank_to_coordinate(notation_idx)
    RANKS.index(notation_idx)
  end
end
