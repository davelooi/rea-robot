require './place'

class Robot
  def initialize(place=nil)
    @place = place
  end

  def place(place)
    @place = place
  end

  def placed?
    @place != nil
  end

  def report
    raise RobotNotPlacedError, "Robot not placed" unless placed?
    x,y = @place.coordinate
    f = @place.direction
    "#{x},#{y},#{f}"
  end

  def move
    raise RobotNotPlacedError, "Robot not placed" unless placed?
    @place.move
  end

  def left
    raise RobotNotPlacedError, "Robot not placed" unless placed?
    @place.turn_left
  end

  def right
    raise RobotNotPlacedError, "Robot not placed" unless placed?
    @place.turn_right
  end
end

class RobotError < StandardError
end

class RobotNotPlacedError < RobotError
end
