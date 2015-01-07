class Direction
  DIRECTIONS = ["NORTH", "SOUTH", "EAST", "WEST"]
  def initialize(direction="NORTH")
    raise ArgumentError unless DIRECTIONS.include? direction
    @direction = direction 
  end

  def to_s
    @direction
  end
end
