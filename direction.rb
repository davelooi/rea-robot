class Direction
  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]
  def initialize(direction="NORTH")
    raise ArgumentError unless DIRECTIONS.include? direction
    @direction = direction 
  end

  def to_s
    @direction
  end

  def turn_left
    turn(:left)
  end

  def turn_right
    turn(:right)
  end

private

  def turn(option)
    index = DIRECTIONS.index(@direction)
    if option == :left
      index -= 1
    else
      index = (index + 1) % 4
    end
    @direction = DIRECTIONS[index]
  end

end
