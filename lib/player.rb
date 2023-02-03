# Stores information about a player instance.
class Player
  def initialize(name, light_or_dark = :light)
    @name = name
    @light_or_dark = light_or_dark
  end
end