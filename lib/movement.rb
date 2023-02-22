class Movement
  def initialize(raw_input)
    @raw_input = raw_input
    @input_handler = InputHandler.new
    @start_place = nil
    @end_place = nil
  end

  def move_piece
    @input_handler.notation = @raw_input
    @input_handler.notation_to_coordinates
    begin
      @start_place = @board.grid[@input_handler.chosen_piece[:x_coord]][@input_handler.chosen_piece[:y_coord]]
      start_place_clone = start_place.clone
      @end_place = @board.grid[@input_handler.chosen_place[:x_coord]][@input_handler.chosen_place[:y_coord]]
    rescue NoMethodError
      raise 'Input is invalid'
    end
    # check if move is legal
    raise 'Move is illegal' unless ok_to_move_to?

    @start_place.current_piece = nil
    @start_place.update_symbol
    @end_place.current_piece = start_place_clone.current_piece
    @end_place.update_symbol
  end

  def is_legal_move?
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
    @end_place.square_available? && is_legal_move?(@start_place, @end_place) # && piece_in_way? == false (if can_hop value is false)
  end

end