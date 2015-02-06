class Grid
  attr_reader :obstacles
  # size of the grid
  SIZE = 5

  # boundaries
  MAX_X = SIZE - 1
  MAX_Y = SIZE - 1
  MIN_X = 0
  MIN_Y = 0

  def initialize
    @obstacles = Set.new
  end

  def place_obstacle(x, y)
    raise ArgumentError if x > MAX_X || y > MAX_Y

    @obstacles.add(x: x, y: y)
  end

  def obstacle_exist?(x, y)
    @obstacles.include?(x: x, y: y)
  end

  def map_of_obstacles
    map = []
    (0..MAX_Y).each do |y|
      temp = []
      (0..MAX_X).each do |x|
        temp.push obstacle_exist?(x, y) ? 1 : 0
      end
      map.push temp
    end
    map
  end

  def prt_map
    output = ''
    map = map_of_obstacles
    map.reverse.each do |y|
      y.each do |x|
        output += (x == 0 ? 'o' : 'x' )
      end
      output += "\n"
    end
    output
  end
end
