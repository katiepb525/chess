class Place

  attr_accessor :x, :y, :predecessor, :distance

  def initialize(x,y, predecessor=nil, distance=nil)
    @x = x
    @y = y
    @predecessor = predecessor
    @distance = distance
  end
  
end