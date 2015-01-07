require './robot'

describe Robot do
  context 'new robot without place' do
    let!(:robot) { Robot.new }

    it { expect(robot.class).to eq Robot }
    it { expect(robot.placed?).to eq false }
  end

  context 'new robot with place' do
    let!(:place) { Place.new(1,2,"NORTH") }
    let!(:robot) { Robot.new(place) }

    it { expect(robot.placed?).to eq true }
    it { expect(robot.report).to eq [1, 2, "NORTH"] }
  end

end
