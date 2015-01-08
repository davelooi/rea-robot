require './robot'

describe Robot do
  context 'new robot without place' do
    let!(:robot) { Robot.new }

    it { expect(robot.class).to eq Robot }
    it { expect(robot.placed?).to eq false }
    it { expect{robot.move}.to raise_error RobotNotPlacedError }
    it { expect{robot.left}.to raise_error RobotNotPlacedError }
    it { expect{robot.right}.to raise_error RobotNotPlacedError }
  end

  context 'new robot with place' do
    let!(:place) { Place.new(1,2,"NORTH") }
    let!(:robot) { Robot.new(place) }

    it { expect(robot.placed?).to eq true }
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
