# frozen_string_literal: true

module Symbols
  def square_light
    square_light = "\u25A1"
    square_light.encode('utf-8')
  end

  def square_dark
    square_dark = "\u25A0"	
    square_dark.encode('utf-8')
  end
  
  def king_light
    king_light = "\u2654"
    king_light.encode('utf-8')
  end

  def king_dark
    king_dark = "\u265a"
    king_dark.encode('utf-8')
  end

  def queen_light
    queen_light = "\u2655"
    queen_light.encode('utf-8')
  end

  def queen_dark
    queen_dark = "\u265b"
    queen_dark.encode('utf-8')
  end

  def rook_light
    rook_light = "\u2656"
    rook_light.encode('utf-8')
  end

  def rook_dark
    rook_dark = "\u265c"
    rook_dark.encode('utf-8')
  end

  def bishop_light
    bishop_light = "\u2657"
    bishop_light.encode('utf-8')
  end

  def bishop_dark
    bishop_dark = "\u265d"
    bishop_dark.encode('utf-8')
  end

  def knight_light
    knight_light = "\u2658"
    knight_light.encode('utf-8')
  end

  def knight_dark
    knight_dark = "\u265e"
    knight_dark.encode('utf-8')
  end

  def pawn_light
    pawn_light = "\u2659"
    pawn_light.encode('utf-8')
  end

  def pawn_dark
    pawn_dark = "\u265f"
    pawn_dark.encode('utf-8')
  end
end
