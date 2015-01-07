class Position
  def initialize(x=0, y=0)
    raise ArgumentError if x >= 5 || y >= 5
    @x = x
    @y = y
  end

  def coordinate
    return @x, @y
  end
end
