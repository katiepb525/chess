# Stores information about a player instance.
class Player
  attr_reader :name, :light_or_dark

  def initialize(name, light_or_dark = :light)
    @name = name
    @light_or_dark = light_or_dark
  end
end