require './application.rb'

class Robot
  def initialize(place)
    @place = place
  end

  def place(place)
    @place = place
  end

  def report
    x,y = @place.coordinate
    f = @place.direction
    "#{x},#{y},#{f}"
  end

  def move
    @place.move
  end

  def left
    @place.turn_left
  end

  def right
    @place.turn_right
  end
end
