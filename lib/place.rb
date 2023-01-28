class Place
  attr_reader :x_coord, :y_coord
  
  def initialize(x_coord,y_coord)
    @x_coord = x_coord
    @y_coord = y_coord
  end
end