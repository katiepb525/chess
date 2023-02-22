class Movement
  def initialize(raw_input)
    @raw_input = raw_input
    @input_handler = InputHandler.new
    @piece_to_move = nil
    @place_to_move_to = nil
  end

  def move_piece
    @input_handler.notation = @raw_input
    @input_handler.notation_to_coordinates
    begin
      @piece_to_move = @board.grid[@input_handler.chosen_piece[:x_coord]][@input_handler.chosen_piece[:y_coord]]
      piece_to_move_clone = piece_to_move.clone
      @place_to_move_to = @board.grid[@input_handler.chosen_place[:x_coord]][@input_handler.chosen_place[:y_coord]]
    rescue NoMethodError
      raise 'Input is invalid'
    end
    # check if move is legal
    raise 'Move is illegal' unless ok_to_move_to?

    @piece_to_move.current_piece = nil
    @piece_to_move.update_symbol
    @place_to_move_to.current_piece = piece_to_move_clone.current_piece
    @place_to_move_to.update_symbol
  end

  def is_legal_move?
    curr_piece = @piece_to_move.current_piece
    legal_moves_of_piece = curr_piece.legal_moves(@piece_to_move)
    legal_moves_of_piece.each do |legal_move|
      return true if legal_move.x_coord == @place_to_move_to.x_coord && legal_move.y_coord == @place_to_move_to.y_coord
    end
    false
  end

  def ok_to_move_to?
    # Should change according to if it can_hop.
    # case curr_place.current_piece.can_hop
    # when false
    @place_to_move_to.square_available? && is_legal_move?(@piece_to_move, @place_to_move_to) # && piece_in_way? == false (if can_hop value is false)
  end

end