require './place'

class Robot
  def initialize(place=nil)
    @place = place
  end

  def placed?
    @place != nil
  end

  def report
    x,y = @place.coordinate
    f = @place.direction
    return x,y,f
  end
end
