class Direction
  directions = [:north, :south, :east, :west]
  def initialize(direction=nil)
    @direction = direction if directions.include? direction
  end

  def direction
    @direction
  end
end