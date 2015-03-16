require './spec/spec_helper'

describe Robot do
  context 'new robot without place' do
    it { expect{Robot.new}.to raise_error ArgumentError }
  end

  context 'new robot with place' do
    let!(:place) { Place.new(1,2,"NORTH") }
    let!(:robot) { Robot.new(place) }

    it { expect(robot.report).to eq "1,2,NORTH" }
  end

  describe 'EXAMPLE' do
    context 'A' do
      let!(:place) { Place.new(0,0,"NORTH") }
      let!(:robot) { Robot.new(place) }

      it 'execute' do
        robot.move
        expect(robot.report).to eq "0,1,NORTH"
      end
    end

    context 'B' do
      let!(:place) { Place.new(0,0,"NORTH") }
      let!(:robot) { Robot.new(place) }

      it 'execute' do
        robot.left
        expect(robot.report).to eq "0,0,WEST"
      end
    end

    context 'C' do
      let!(:place) { Place.new(1,2,"EAST") }
      let!(:robot) { Robot.new(place) }

      it 'execute' do
        robot.move
        robot.move
        robot.left
        robot.move
        expect(robot.report).to eq "3,3,NORTH"
      end
    end
  end

end
