class Piece
  attr_reader :possible_directions

  def initialize
    @possible_directions = nil
  end

  def coordinate_invalid?(result)
    result[0] >= 8 || result[1] >= 8 || result[0].negative? || result[1].negative?
  end

  def legal_moves
    "Oops, this object does not define it's legal_moves."
  end
end