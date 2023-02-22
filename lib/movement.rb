# frozen_string_literal: true

require './lib/input_handler'

# Manages movement of pieces and sees if illegal moves are attempting to be made.
class Movement
  attr_reader :board

  def initialize(raw_input, board)
    @raw_input = raw_input
    @board = board
    @input_handler = InputHandler.new
    @start_place = nil
    @end_place = nil
  end

  def move_piece
    translate_coordinates
    set_start_and_end
    raise 'Move is illegal' unless ok_to_move_to?

    update_board
  end

  private

  def translate_coordinates
    @input_handler.notation = @raw_input
    @input_handler.notation_to_coordinates
  end

  def set_start_and_end
    @start_place = @board.grid[@input_handler.chosen_piece[:x_coord]][@input_handler.chosen_piece[:y_coord]]
    @end_place = @board.grid[@input_handler.chosen_place[:x_coord]][@input_handler.chosen_place[:y_coord]]
  rescue NoMethodError
    raise 'Input is invalid'
  end

  # this should be boardhandler's responsibility, not movement's
  def update_board
    start_place_clone = @start_place.clone
    @start_place.current_piece = nil
    @start_place.update_symbol
    @end_place.current_piece = start_place_clone.current_piece
    @end_place.update_symbol
  end

  def legal_move?
    curr_piece = @start_place.current_piece
    legal_moves_of_piece = curr_piece.legal_moves(@start_place)
    legal_moves_of_piece.each do |legal_move|
      return true if legal_move.x_coord == @end_place.x_coord && legal_move.y_coord == @end_place.y_coord
    end
    false
  end

  def ok_to_move_to?
    # Should change according to if it can_hop.
    case @start_place.current_piece.can_hop
    when false
      @end_place.square_available? && legal_move? && path_clear?
    when true
      @end_place.square_available? && legal_move?
    end
  end

  def path_clear?
    # grab spaces to check -- places between
    # check list of spaces with square_occupied
    to_check = places_between
    to_check.all?(&:square_available?)
  end

  def places_between
    return if @start_place.x_coord == @end_place.x_coord && @start_place.y_coord == @end_place.y_coord

    if @start_place.x_coord == @end_place.x_coord
      vert_places_between
    elsif @start_place.y_coord == @end_place.y_coord
      horiz_places_between
    else
      diag_places_between
    end
  end

  def horiz_places_between
    list = []
    y_coord = @start_place.y_coord
    if @start_place.x_coord < @end_place.x_coord
      offset_start = @start_place.x_coord + 1
      offset_end = @end_place.x_coord - 1
      range = (offset_start..offset_end)
    else
      offset_start = @start_place.x_coord - 1
      offset_end = @end_place.x_coord + 1
      range = (offset_start..offset_end).to_a
    end

    range.each do |x_coord|
      list.push(@board.grid[y_coord][x_coord])
    end
    list
  end

  def vert_places_between
    list = []
    x_coord = @start_place.x_coord
    if @start_place.y_coord < @end_place.y_coord
      offset_start = @start_place.y_coord + 1
      offset_end = @end_place.y_coord - 1
      range = (offset_start..offset_end)
    else
      offset_start = @start_place.y_coord - 1
      offset_end = @end_place.y_coord + 1
      range = (offset_start..offset_end).to_a
    end

    range.each do |y_coord|
      list.push(@board.grid[y_coord][x_coord])
    end
    list
  end

  def diag_places_between
    if @start_place.x_coord > @end_place.x_coord && @end_place.y_coord < @start_place.y_coord
      diag_r_places_between
    else
      diag_l_places_between
    end
  end

  def diag_r_places_between
    list = []

    offset_start = { x_coord: @start_place.x_coord + 1, y_coord: @start_place.y_coord - 1 }
    offset_end = { x_coord: @end_place.x_coord - 1, y_coord: @end_place.y_coord + 1 }
    range_x = (offset_start.x_coord..offset_end.x_coord).to_a
    range_y = (offset_start.y_coord..offset_end.y_coord).to_a

    range_y.each do |y_coord|
      range_x.each do |x_coord|
        list.push(@board.grid[y_coord][x_coord])
      end
    end
    list
  end

  def diag_l_places_between
    list = []

    offset_start = { x_coord: @start_place.x_coord - 1, y_coord: @start_place.y_coord + 1 }
    offset_end = { x_coord: @end_place.x_coord + 1, y_coord: @end_place.y_coord - 1 }
    range_x = (offset_start.x_coord..offset_end.x_coord).to_a
    range_y = (offset_start.y_coord..offset_end.y_coord).to_a

    range_y.each do |y_coord|
      range_x.each do |x_coord|
        list.push(@board.grid[y_coord][x_coord])
      end
    end
    list
  end
end
