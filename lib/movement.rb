# frozen_string_literal: true

# Manages movement of pieces and sees if illegal moves are attempting to be made.
class Movement
  def initialize(board)
    @board = board
    @start_place = nil
    @end_place = nil
  end

  def get_start_and_end(input_handler)
    @start_place = input_handler.start_place
    @end_place = input_handler.end_place
  end

  # Checks for illegal moves and asks for new notation. Only moves piece when move is not illegal.
  def handle_player_movement(input_handler)
    input_handler.handle_player_input(@board) # grabs new notation 
    get_start_and_end(input_handler) # updates notation
    case ok_to_move_to?
    when true
      move_piece
    when false
      until ok_to_move_to?
        puts "That move is illegal. Please enter a legal move."
        input_handler.handle_player_input(@board) # grabs new notation 
        get_start_and_end(input_handler) # updates notation
      end
      move_piece
    end
  end

  def ok_to_move_to?
    return false if @start_place.square_available? # Start should not be empty.
    
    # Should change according to if it can_hop.
    case @start_place.current_piece.can_hop
    when false
      @end_place.square_available? && legal_move? && path_clear?
    when true
      @end_place.square_available? && legal_move?
    end
  end

  def move_piece
    update_board if ok_to_move_to?
  end

  private

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

  def path_clear?
    # grab spaces to check -- places between
    # check list of spaces with square_occupied
    to_check = places_between
    return true if places_between.empty?

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

  def nothing_between_x?
    @start_place.x_coord - 1 == @end_place.x_coord || @end_place.x_coord - 1 == @start_place.x_coord ||
      @start_place.x_coord + 1 == @end_place.x_coord || @end_place.x_coord + 1 == @start_place.x_coord
  end

  def nothing_between_y?
    @start_place.y_coord - 1 == @end_place.y_coord || @end_place.y_coord - 1 == @start_place.y_coord ||
      @start_place.y_coord + 1 == @end_place.y_coord || @end_place.y_coord + 1 == @start_place.y_coord
  end

  # def nothing_between_diag?

  # end

  def horiz_places_between
    list = []
    return list if nothing_between_x?

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
    return list if nothing_between_y?

    x_coord = @start_place.x_coord
    if @start_place.y_coord < @end_place.y_coord
      offset_start = @start_place.y_coord + 1
      offset_end = @end_place.y_coord - 1
      range = (offset_start..offset_end).to_a
    else
      offset_start = @start_place.y_coord - 1
      offset_end = @end_place.y_coord + 1
      range = (offset_start..offset_end)
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
    # return list if nothing_between_diag?

    offset_start = { x_coord: @start_place.x_coord + 1, y_coord: @start_place.y_coord - 1 }
    offset_end = { x_coord: @end_place.x_coord - 1, y_coord: @end_place.y_coord + 1 }
    range_x = (offset_start[:x_coord]..offset_end[:x_coord]).to_a
    range_y = (offset_start[:y_coord]..offset_end[:y_coord]).to_a

    range_y.each do |y_coord|
      range_x.each do |x_coord|
        list.push(@board.grid[y_coord][x_coord])
      end
    end
    list
  end

  def diag_l_places_between
    list = []
    # return list if nothing_between_diag?

    offset_start = { x_coord: @start_place.x_coord - 1, y_coord: @start_place.y_coord + 1 }
    offset_end = { x_coord: @end_place.x_coord + 1, y_coord: @end_place.y_coord - 1 }
    range_x = (offset_start[:x_coord]..offset_end[:x_coord]).to_a
    range_y = (offset_start[:y_coord]..offset_end[:y_coord]).to_a

    range_y.each do |y_coord|
      range_x.each do |x_coord|
        list.push(@board.grid[y_coord][x_coord])
      end
    end
    list
  end
end
