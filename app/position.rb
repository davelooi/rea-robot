require './application.rb'

class Position < Grid
  def initialize(x=0, y=0)
    raise ArgumentError if x > MAX_X || y > MAX_Y
    @x = x
    @y = y
    super()
  end

  def coordinate
    return @x, @y
  end

  def move_north
    move(:north)
  end
  def move_east
    move(:east)
  end
  def move_south
    move(:south)
  end
  def move_west
    move(:west)
  end

private

  def move(option)
    x = @x
    y = @y
    if option == :north
      y += 1 if y < MAX_Y
    elsif option == :east
      x += 1 if x < MAX_X
    elsif option == :south
      y -= 1 if y > MIN_Y
    elsif option == :west
      x -= 1 if x > MIN_X
    else
      # do nothing
    end

    unless obstacle_exist?(x,y)
      @x = x
      @y = y
    end

    self
  end
end
