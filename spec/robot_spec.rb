require './robot'

describe Robot do
  context '.new' do
    let!(:robot) { Robot.new }

    it { expect(robot.class).to eq Robot }
    it { expect(robot.placed?).to eq false }
  end

  context 'new robot with place' do
    let!(:position) { Position.new(1,2) }
    let!(:direction) { :north }
    let!(:robot) { Robot.new(position, direction) }

    it { expect(robot.placed?).to eq true }
    it { expect(robot.report).to eq [position, direction] }
  end
end
