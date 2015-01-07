require './direction'
require './position'

class Robot
  def initialize(pos=nil, facing=nil)
    @pos = pos
    @facing = facing
  end

  def placed?
    return false if @pos == nil
    return false if @facing == nil
    true
  end

  def report
    return @pos, @facing
  end
end
