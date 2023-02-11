# frozen_string_literal: true

# Stores information about a player instance.
class Player
  attr_reader :player_num, :light_or_dark
  attr_accessor :raw_input, :name

  def initialize(player_num)
    @name = name
    @player_num = player_num
    @light_or_dark = light_or_dark_pieces?
    @raw_input = nil
  end

  def light_or_dark_pieces?
    case @player_num
    when 1
      :light
    when 2
      :dark
    else
      raise "Huh?! There can't be more than two players!"
    end
  end
end
