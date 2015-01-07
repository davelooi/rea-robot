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

  def turn_left
    @direction.turn_left
    self
  end

  def turn_right
    @direction.turn_right
    self
  end

  def move
    eval "@position.move_#{direction.downcase}"
  end
end
