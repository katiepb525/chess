# frozen_string_literal: true

class Movement
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
    # case curr_place.current_piece.can_hop
    # when false
    @end_place.square_available? && legal_move?(@start_place, @end_place) # && piece_in_way? == false (if can_hop value is false)
  end

  def piece_in_way?
    # grab spaces to check -- places between
    # check list of spaces with square_occupied
    to_check = places_between

    places_between.all?(&:square_available?)
  end

  def places_between
    return if @start_place.x_coord == @end_place.x_coord && @start_place.y_coord == @end_place.y_coord

    if @start_place.x_coord == @end_place.x_coord
      horiz_places_between
    elsif @start_place.y_coord == @end_place.y_coord
      vert_places_between
    else
      diag_places_between
    end
  end
end
