# frozen_string_literal: true

module Symbols
  def rook_light
    rook_light = "\u2656"
    rook_light.encode('utf-8')
  end

  def rook_dark
    rook_dark = "\u265c"
    rook_dark.encode('utf-8')
  end

  def knight_light
    knight_light = "\u2658"
    knight_light.encode('utf-8')
  end

  def knight_dark
    knight_dark = "\u265e"
    knight_dark.encode('utf-8')
  end
end
