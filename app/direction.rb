class Direction
  DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

  def initialize(direction="NORTH")
    raise ArgumentError unless DIRECTIONS.include? direction
    @index = DIRECTIONS.index(direction)
  end

  def to_s
    DIRECTIONS[@index]
  end

  def turn_left
    turn(:left)
  end

  def turn_right
    turn(:right)
  end

private

  def turn(option)
    if option == :left
      @index -= 1
    else
      @index = (@index + 1) % 4
    end
  end

end
