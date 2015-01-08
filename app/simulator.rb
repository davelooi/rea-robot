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
    @robot = Robot.new

    puts "Executing #{file}"
    f = File.open(file, "r")
    f.each_line do |line|
      process_command line
    end
    f.close
    puts "\n\n"
  end

  def self.process_command(command)
    puts "#{command}"
    begin
      if /PLACE/.match(command)
        process_place command
      elsif /REPORT/.match(command)
        puts "#{@robot.report}"
      elsif /MOVE|LEFT|RIGHT/.match(command)
        eval "@robot.#{command.downcase}"
      else
        raise ArgumentError, "Invalid Command"
      end
    rescue RobotNotPlacedError
      puts "Robot has not been placed!!"
    end
  end

  def self.process_place(command)
    matched = /PLACE (?<x>\d+),(?<y>\d+),(?<f>\w+)/.match(command)
    x = matched[:x].to_i
    y = matched[:y].to_i
    f = matched[:f]
    place = Place.new(x,y,f)
    @robot.place(place)
  end
end
