Toy Robot Simulator
===================

## Installation Instruction

    git clone https://github.com/davelooi/rea-robot.git
    cd rea-robot
    bundle install

## RSpec Instruction

    bundle exec rake test

## Execute Simulations

    bundle exec rake

## More Simulations
- Add to command/ dir
- Simulation file need to be in *.txt format

##Accepted commands

    PLACE x,y,DIRECTION
    MOVE
    LEFT
    RIGHT
    REPORT

x and y are integers (0..4)
DIRECTION could be NORTH, SOUTH, EAST, WEST
 