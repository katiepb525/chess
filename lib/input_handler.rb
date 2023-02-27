# frozen_string_literal: true
require './lib/display'

# Manages player input.
class InputHandler
  include Display
  attr_reader :start_place, :end_place

  RANKS = %w[a b c d e f g h].freeze
  FILES = %w[1 2 3 4 5 6 7 8].freeze

  def initialize
    @notation = nil
    @start_place = nil
    @end_place = nil
  end

  # Loops gets until notation is valid. Only translates coordinates when given valid notation.
  def handle_player_input(board) # rename method?
    raw_input = gets.chomp
    @notation = raw_input
    notation_valid = notation_is_valid?

    until notation_valid
      if notation_valid == false
        puts display_bad_input
      end
      raw_input = gets.chomp
      @notation = raw_input
      notation_valid = notation_is_valid?
    end

    translate_coordinates(board)
  end

  def translate_coordinates(board)
    @start_place = board.grid[start_to_coord[:x_coord]][start_to_coord[:y_coord]]
    @end_place = board.grid[end_to_coord[:x_coord]][end_to_coord[:y_coord]]
  end
  
  private

  def notation_is_valid?
    return false if @notation.length != 4

    has_valid_files? && has_valid_ranks? && places_not_same?
  end
  
  def start_to_coord    
    curr_file_1 = @notation[1]
    curr_rank_1 = @notation[0]
    to_coords(curr_file_1, curr_rank_1)
  end

  def end_to_coord
    curr_file_2 = @notation[3]
    curr_rank_2 = @notation[2]
    to_coords(curr_file_2, curr_rank_2)
  end

  def to_coords(file, rank)
    coordinates = { x_coord: nil, y_coord: nil }
    coordinates[:x_coord] = file_to_coordinate(file)
    coordinates[:y_coord] = rank_to_coordinate(rank)
    coordinates
  end

  def places_not_same?
    @notation[0..1] != @notation[2..3]
  end

  def has_valid_ranks?
    RANKS.include?(@notation[0])
    RANKS.include?(@notation[2])
  end

  def has_valid_files?
    FILES.include?(@notation[1])
    FILES.include?(@notation[3])
  end

  def correct_obj_types?
    begin
      @notation[1].to_i
    rescue
      return false
    end
    
    begin 
      @notation[3].to_i
    rescue
      return false
    end

    true
  end

  def rank_to_coordinate(notation_idx)
    RANKS.index(notation_idx)
  end

  def file_to_coordinate(notation_idx)
    7 - FILES.index(notation_idx) # because files are picked from bottom-up on board
  end
end
