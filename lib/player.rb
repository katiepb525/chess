# frozen_string_literal: true

# Stores information about a player instance.
class Player
  attr_reader :num, :light_or_dark
  attr_accessor :raw_input, :name

  def initialize(num)
    @name = name
    @num = num
    @light_or_dark = light_or_dark_pieces?
    @raw_input = nil
  end

  private
  
  def light_or_dark_pieces?
    case @num
    when 1
      :light
    when 2
      :dark
    else
      raise "Huh?! There can't be more than two players!"
    end
  end
end
