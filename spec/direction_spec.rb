require './spec/spec_helper'

describe Direction do
  context 'new' do
    let!(:direction) { Direction.new }

    it { expect(direction.class).to eq Direction }
    it { expect(direction.to_s).to eq "NORTH" }
  end
  context 'new with param' do
    let!(:direction) { Direction.new("EAST") }

    it { expect(direction.to_s).to eq "EAST" }
  end
  context 'new with invalid param' do
    it 'should raise ArgumentError' do
      expect { Direction.new("SOUTHEAST") }.to raise_error(ArgumentError)
    end
  end

  describe 'turn left' do
    let!(:expected_left_turn) {{
      "NORTH" => "WEST",
      "WEST" => "SOUTH",
      "SOUTH" => "EAST",
      "EAST" => "NORTH"
    }}

    it 'should result in expected direction' do
      expected_left_turn.each do |origin, result|
        direction = Direction.new(origin)
        direction.turn_left
        expect(direction.to_s).to eq result
      end
    end
  end

  describe 'turn right' do
    let!(:expected_right_turn) {{
      "NORTH" => "EAST",
      "WEST" => "NORTH",
      "SOUTH" => "WEST",
      "EAST" => "SOUTH"
    }}

    it 'should result in expected direction' do
      expected_right_turn.each do |origin, result|
        direction = Direction.new(origin)
        direction.turn_right
        expect(direction.to_s).to eq result
      end
    end
  end
end
