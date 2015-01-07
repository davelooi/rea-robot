require './robot'

class Simulator
  def self.execute(file_args)
    files = []
    files << file_args

    files.each do |file|
      process_file file
    end
  end

  def self.process_file(file)
    # new robot for every file
    @robot = Robot.new

    f = File.open(file, "r")
    f.each_line do |line|
      process_command line
    end
    f.close
  end

  def self.process_command(command)
    if /PLACE/.match(command)
      process_place command
    elsif /REPORT/.match(command)
      puts @robot.report
    else
      eval "@robot.#{command.downcase}"
    end
  end

  def self.process_place(command)
    arg = command.split(' ')
    params = arg[1].split(',')
    place = Place.new(params[0].to_i,params[1].to_i,params[2])
    @robot.place(place)
  end
end
