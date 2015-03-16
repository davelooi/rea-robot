require './application.rb'

class Simulator
  def self.execute(file_args)
    files = Array(file_args)

    files.each do |file|
      process_file file
    end
  end

private

  def self.process_file(file)
    # new robot for every file
    @robot = nil

    puts "Executing #{file}"
    f = File.open(file, "r")
    f.each_line do |line|
      process_command line
    end
    f.close
    puts "\n\n"
  end

  def self.process_command(command)
    # remove whitespace
    command.strip!

    # blank line, nothing to process
    return if command.empty?

    puts "#{command}"
    if /PLACE/.match(command)
      process_place command
    elsif /REPORT/.match(command)
      return if @robot.nil?
      puts "#{@robot.report}"
    elsif /MOVE|LEFT|RIGHT/.match(command)
      return if @robot.nil?
      eval "@robot.#{command.downcase}"
    else
      raise ArgumentError, "Invalid Command"
    end
  end

  def self.process_place(command)
    matched = /PLACE (?<x>\d+),(?<y>\d+),(?<f>\w+)/.match(command)
    x = matched[:x].to_i
    y = matched[:y].to_i
    f = matched[:f]
    place = Place.new(x,y,f)
    place_robot(place)
  end

  def self.place_robot(place)
    # create new robot if nil, else just re-place the robot
    @robot.nil? ? @robot = Robot.new(place) : @robot.place(place)
  end
end
