require './direction'
require './position'

class Place
  def initialize(x=0, y=0, f="NORTH")
    @position = Position.new(x,y)
    @direction = Direction.new(f)
  end

  def current
    return @position, @direction
  end

  def coordinate
    @position.coordinate
  end

  def direction
    @direction.to_s
  end
end
